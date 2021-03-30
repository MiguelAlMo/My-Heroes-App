// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let heroe = try? newJSONDecoder().decode(Heroe.self, from: jsonData)

import Foundation

// MARK: - Heroe
class Heroe: Codable {
    let response, id, name: String?
    let powerstats: Powerstats?
    let biography: Biography?
    let appearance: Appearance?
    let work: Work?
    let connections: Connections?
    let image: Image?

    init(response: String?, id: String?, name: String?, powerstats: Powerstats?, biography: Biography?, appearance: Appearance?, work: Work?, connections: Connections?, image: Image?) {
        self.response = response
        self.id = id
        self.name = name
        self.powerstats = powerstats
        self.biography = biography
        self.appearance = appearance
        self.work = work
        self.connections = connections
        self.image = image
        
    }
}


// MARK: - Appearance
class Appearance: Codable {
    let gender, race: String?
    let height, weight: [String]?
    let eyeColor, hairColor: String?

    enum CodingKeys: String, CodingKey {
        case gender, race, height, weight
        case eyeColor = "eye-color"
        case hairColor = "hair-color"
    }

    init(gender: String?, race: String?, height: [String]?, weight: [String]?, eyeColor: String?, hairColor: String?) {
        self.gender = gender
        self.race = race
        self.height = height
        self.weight = weight
        self.eyeColor = eyeColor
        self.hairColor = hairColor
    }
}

// MARK: - Biography
class Biography: Codable {
    let fullName, alterEgos: String?
    let aliases: [String]?
    let placeOfBirth, firstAppearance, alignment: String?
    let publisher: HeroesType?
    

    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case alterEgos = "alter-egos"
        case aliases
        case placeOfBirth = "place-of-birth"
        case firstAppearance = "first-appearance"
        case publisher, alignment
    }

    init(fullName: String?, alterEgos: String?, aliases: [String]?, placeOfBirth: String?, firstAppearance: String?, publisher: HeroesType?, alignment: String?) {
        self.fullName = fullName
        self.alterEgos = alterEgos
        self.aliases = aliases
        self.placeOfBirth = placeOfBirth
        self.firstAppearance = firstAppearance
        self.publisher = publisher
        self.alignment = alignment
        
    }
}

// MARK: - Connections
class Connections: Codable {
    let groupAffiliation, relatives: String?

    enum CodingKeys: String, CodingKey {
        case groupAffiliation = "group-affiliation"
        case relatives
    }

    init(groupAffiliation: String?, relatives: String?) {
        self.groupAffiliation = groupAffiliation
        self.relatives = relatives
    }
}

// MARK: - Image
class Image: Codable {
    let url: String?

    init(url: String?) {
        self.url = url
    }
}

// MARK: - Powerstats
class Powerstats: Codable {
    let intelligence, strength, speed, durability: String?
    let power, combat: String?
    var totalPower : Int? {
        return (intelligenceInt + strengthInt + speedInt + durabilityInt + powerInt + combatInt) / 6
    }
    
    var intelligenceInt : Int {
        Int(intelligence ?? "0") ?? 0
    }
    var strengthInt : Int {
        Int(strength ?? "0") ?? 0
    }
    var speedInt : Int {
        Int(speed ?? "0") ?? 0
    }
    var durabilityInt : Int {
        Int(durability ?? "0") ?? 0
    }
    var powerInt : Int {
        Int(power ?? "0") ?? 0
    }
    var combatInt : Int {
        Int(combat ?? "0") ?? 0
    }

    var iconIntelligence: String {
        switch Int(intelligence ?? "0") ?? 0 {
            case 0...19 : return "icono_power_blue_uno"
            case 20...39 :return "icono_power_blue_dos"
            case 40...59 :return "icono_power_blue_tres"
            case 60...79 :return "icono_power_blue_cuatro"
            case 80...100:return "icono_power_blue_cinco"
            default: return "icono_power_blue_cinco"
        }
    }
    
    var iconStrength: String {
        switch Int(strength ?? "0") ?? 0 {
            case 0...19 : return "icono_power_blue_uno"
            case 20...39 :return "icono_power_blue_dos"
            case 40...59 :return "icono_power_blue_tres"
            case 60...79 :return "icono_power_blue_cuatro"
            case 80...100:return "icono_power_blue_cinco"
            default: return "icono_power_blue_cinco"
        }
    }
    
    var iconSpeed: String {
        switch Int(speed ?? "0") ?? 0 {
            case 0...19 : return "icono_power_blue_uno"
            case 20...39 :return "icono_power_blue_dos"
            case 40...59 :return "icono_power_blue_tres"
            case 60...79 :return "icono_power_blue_cuatro"
            case 80...100:return "icono_power_blue_cinco"
            default: return "icono_power_blue_cinco"
        }
    }
    
    var iconDurability: String {
        switch Int(durability ?? "0") ?? 0 {
            case 0...19 : return "icono_power_blue_uno"
            case 20...39 :return "icono_power_blue_dos"
            case 40...59 :return "icono_power_blue_tres"
            case 60...79 :return "icono_power_blue_cuatro"
            case 80...100:return "icono_power_blue_cinco"
            default: return "icono_power_blue_cinco"
        }
    }
    
    var iconPower: String {
        switch Int(power ?? "0") ?? 0 {
            case 0...19 : return "icono_power_blue_uno"
            case 20...39 :return "icono_power_blue_dos"
            case 40...59 :return "icono_power_blue_tres"
            case 60...79 :return "icono_power_blue_cuatro"
            case 80...100:return "icono_power_blue_cinco"
            default: return "icono_power_blue_cinco"
        }
    }
    
    var iconCombat: String {
        switch Int(combat ?? "0") ?? 0 {
            case 0...19 : return "icono_power_blue_uno"
            case 20...39 :return "icono_power_blue_dos"
            case 40...59 :return "icono_power_blue_tres"
            case 60...79 :return "icono_power_blue_cuatro"
            case 80...100:return "icono_power_blue_cinco"
            default: return "icono_power_blue_cinco"
        }
    }
    
    
    
    
    
    init(intelligence: String?, strength: String?, speed: String?, durability: String?, power: String?, combat: String?, statBar: String?, totalPower: Int?) {
        self.intelligence = intelligence
        self.strength = strength
        self.speed = speed
        self.durability = durability
        self.power = power
        self.combat = combat
    }
    
}

// MARK: - Work
class Work: Codable {
    let occupation, base: String?

    init(occupation: String?, base: String?) {
        self.occupation = occupation
        self.base = base
    }
}



