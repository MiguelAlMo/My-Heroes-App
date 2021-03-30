//
//  HeroEntityMapper.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 15/3/21.
//

import Foundation
import CoreData

class HeroEntityMapper {
    
    static func map (_ heroDTO: HeroDTO, context: NSManagedObjectContext) -> HeroEntity? {
        guard let heroEntity = NSEntityDescription.insertNewObject(forEntityName: "HeroEntity", into: context) as? HeroEntity else {
            return nil
        }
        
        heroEntity.id = heroDTO.id
        heroEntity.name = heroDTO.name
        
        if let powerStats = heroDTO.powerstats,
           let powerStatsEntity = PowerStatsEntityMapped.map(powerStats, context: context) {
            heroEntity.powerstats = powerStatsEntity
        }
        
        if let image = heroDTO.image,
           let imageEntity = ImageEntityMapped.map(image, context: context) {
            heroEntity.image = imageEntity
        }
        
        if let biography = heroDTO.biography,
           let biographyEntity = BiographyEntityMapped.map(biography, context: context) {
            heroEntity.biography = biographyEntity
        }
        if let appearance = heroDTO.appearance {
            heroEntity.appearance = AppearanceEntityMapped.map(appearance, context: context)
           }

        return heroEntity
    }
}

class PowerStatsEntityMapped {
    
    static func map (_ powerStatsDTO: PowerstatsDTO, context: NSManagedObjectContext) -> PowerstatsEntity? {
        guard let powerStatsEntity = NSEntityDescription.insertNewObject(forEntityName: "PowerstatsEntity", into: context) as? PowerstatsEntity else {
            return nil
        }
        
        powerStatsEntity.combat = Int16(powerStatsDTO.combat ?? "0") ?? 0
        powerStatsEntity.durability = Int16(powerStatsDTO.durability ?? "0") ?? 0
        powerStatsEntity.intelligence = Int16(powerStatsDTO.intelligence ?? "0") ?? 0
        powerStatsEntity.power = Int16(powerStatsDTO.power ?? "0") ?? 0
        powerStatsEntity.speed = Int16(powerStatsDTO.speed ?? "0") ?? 0
        powerStatsEntity.strength = Int16(powerStatsDTO.strength ?? "0") ?? 0
        
        return powerStatsEntity
    }
}

class ImageEntityMapped {
    
    static func map (_ imageDTO: ImageDTO, context: NSManagedObjectContext) -> ImageEntity? {
        guard let imageEntity = NSEntityDescription.insertNewObject(forEntityName: "ImageEntity", into: context) as? ImageEntity else {
            return nil
        }
        
        imageEntity.url = imageDTO.url
        
        return imageEntity
    }
}

class BiographyEntityMapped {
    
    static func map (_ biographyDTO: BiographyDTO, context: NSManagedObjectContext) -> BiographyEntity? {
        guard let biographyEntity = NSEntityDescription.insertNewObject(forEntityName: "BiographyEntity", into: context) as? BiographyEntity else {
            return nil
        }
        biographyEntity.publisher = biographyDTO.publisher?.rawValue
        
        return biographyEntity
    }
}

class AppearanceEntityMapped {

    static func map (_ appearanceDTO: AppearanceDTO, context: NSManagedObjectContext) -> AppearanceEntity? {
        guard let appearanceEntity = NSEntityDescription.insertNewObject(forEntityName: "AppearanceEntity", into: context) as? AppearanceEntity else {
            return nil
        }
        appearanceEntity.race = appearanceDTO.race ?? ""

        return appearanceEntity
    }
}




