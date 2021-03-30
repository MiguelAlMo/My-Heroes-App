//
//  Data_Providers.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 10/3/21.
//

import UIKit
import CoreData

/// The DataProvider class defines the `shared` field that lets clients access the
/// unique singleton instance.
class DataProvider {
    // MARK: - SINGLETON start -
    /// The static field that controls the access to the DataProvider instance.
    /// This implementation let you extend the DataProvider class while keeping
    /// just one instance of each subclass around.
    static var shared: DataProvider = {
        return DataProvider()
    }()
    
    /// The DataProvider initializer should always be private to prevent direct
    /// construction calls with the `new` operator.
    private init() {}
    // MARK: - SINGLETON end -
    
    
    let placeholderImage = UIImage(named: "marvel_vs_dc")
    
    let characterMaxCount = 732
      var loadCharacterObserver: ((_ progress: Float) -> ())? = nil
      var loadCharactersCount = 0 {
        didSet{
          loadCharacterObserver?(Float(loadCharactersCount) / Float (characterMaxCount))
        }
      }
    
    func downLoadHeroes(){
        
        for id in 0...characterMaxCount {
            ApiService.shared.fetchHero(by: "\(id)") { [weak self] result in
                switch result {
                    case .success(let data):
                        guard let heroDTO = data as? HeroDTO,
                              !(heroDTO.id?.isEmpty ?? true),
                              let appDelegate = UIApplication.shared.delegate as? AppDelegate
                              else {
                            break
                        }
                        let context = appDelegate.persistentContainer.viewContext
                        _ = HeroEntityMapper.map(heroDTO, context: context)

                        try? context.save()
                    case .failure(_):
                        break
                }
                self?.loadCharactersCount += 1
            }
        }

    }
    func isHeroesDownloaded() -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
              return false
            }
           let  moc =  appDelegate.persistentContainer.viewContext
        let fetchHeroes = NSFetchRequest<NSManagedObject>(entityName: "HeroEntity")
        return !((try? moc.fetch(fetchHeroes) as? [HeroEntity])?.isEmpty ?? true)
      }
    
    func loadHeroes () -> [HeroEntity] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
              return []
            }
            let moc = appDelegate.persistentContainer.viewContext
            let fetchHeroe = NSFetchRequest<NSManagedObject>(entityName: "HeroEntity")
            
            return (try? moc.fetch(fetchHeroe) as? [HeroEntity]) ?? []
    }
    
    func filterAllHeroes(by heroType: HeroesType) -> [HeroEntity] {
        loadHeroes().filter {
            ($0.biography?.publisher?.contains(heroType.rawValue) ?? false)
        }
    }
}
