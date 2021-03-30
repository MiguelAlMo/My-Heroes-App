//
//  Data_Decoder.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 9/3/21.
//

import Foundation
import CoreData
import UIKit

let keyHeroesSelected = "keyHeroesSelected"
//
//func encoderAndSaveHeroeSelected (listHero: [HeroEntity]){
//    let HeroesSelectedData = try! JSONEncoder().encode(listHero)
//    UserDefaults.standard.setValue(HeroesSelectedData, forKey: keyHeroesSelected)
//}
//
//func decodeHeroesSelected () -> [HeroEntity]{
//
//    let HeroesSelectedDataUserDefaultData = UserDefaults.standard.data(forKey: keyHeroesSelected)!
//
//    let HeroesSeleccionados = try! JSONDecoder().decode([HeroEntity].self, from: HeroesSelectedDataUserDefaultData)
//    return HeroesSeleccionados
//}
func addHeroesTeam(characterId: [String]) {
    UserDefaults.standard.setValue(characterId, forKey: keyHeroesSelected)
  }

func getHeroesTeam() -> [HeroEntity]? {
    if let characterId = UserDefaults.standard.value(forKey: keyHeroesSelected){
        return fetchCharacter(by: characterId as? [String] ?? [])
    } else {
      return nil
    }
  }

func fetchCharacter(by charactersId: [String]) -> [HeroEntity]? {
    var charactersFromDB: [HeroEntity]?
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{
        return nil
    }
    let moc = appDelegate.persistentContainer.viewContext
    
    charactersId.forEach { (id) in
        let fetchCharacter = NSFetchRequest<NSManagedObject>(entityName: "HeroEntity")
        fetchCharacter.predicate = NSPredicate(format: "id=%@", id)
        let characterFromDB = try? moc.fetch(fetchCharacter).first as? HeroEntity
        if let hero = characterFromDB {
            charactersFromDB?.append(hero)
        }
    }
    return charactersFromDB
}

