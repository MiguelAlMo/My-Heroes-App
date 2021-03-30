//
//  CoreDataManager.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 13/3/21.
//

import Foundation

//1
import CoreData
class CoreDataManager {
    //2
    private let container : NSPersistentContainer!
    //3
    init() {
        container = NSPersistentContainer(name: "HeroeData")
        
        setupDatabase()
    }
    
    private func setupDatabase() {
        //4
        container.loadPersistentStores { (desc, error) in
            if let error = error {
                print("Error loading store \(desc) — \(error)")
                return
            }
            print("Database ready!")
        }
    }
    
    func createHero(aparence: AppearanceEntity,completion: @escaping() -> Void) {

        let context = container.viewContext

        let hero = HeroEntity(context: context)
        

        do {
            try context.save()
            //print("heroe \(name) guardado")
            completion()
         } catch {

           print("Error guardando heroe — \(error)")
        }
    }
    
    func fetchHero() -> [HeroEntity] {
        
        let fetchRequest : NSFetchRequest<HeroEntity> = HeroEntity.fetchRequest()
        
        do {
            let result = try container.viewContext.fetch(fetchRequest)
            return result
            
        } catch {
            
            print("El error obteniendo heroe(s) \(error)")
        }
        return []
    }
}
