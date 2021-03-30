//
//  HeroEntityExtension.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 29/3/21.
//

import Foundation
import CoreData
extension HeroEntity {
  
//  var heroPublisher: BiographyEntity {
//    return heroPublisher(rawValue: biography.publisher)
//  }
//  var logoPublisher : String {
//    switch heroPublisher {
//      case .marvel:
//        return "Marvel Comics"
//      case .dc:
//        return "DC Comics"
//      default:
//        return ""
//    }
//  }
    var totalPow1: Int16 {
        return (powerstats?.intelligence ?? 0) + (powerstats?.strength ?? 0) + (powerstats?.speed ?? 0)
    }
    var totalPow2: Int16 {
        return (powerstats?.power ?? 0) + (powerstats?.durability ?? 0) + (powerstats?.combat ?? 0)
    }
    var totalPower: Int16 {
        (totalPow1 + totalPow2) / 6
    }
    
    
    var iconIntelligence: String {
        switch powerstats?.intelligence ?? 0 {
            case 0...19 : return "icono_power_blue_uno"
            case 20...39 :return "icono_power_blue_dos"
            case 40...59 :return "icono_power_blue_tres"
            case 60...79 :return "icono_power_blue_cuatro"
            case 80...100:return "icono_power_blue_cinco"
            default: return "icono_power_blue_cinco"
        }
    }
    
    var iconStrength: String {
        switch powerstats?.strength ?? 0 {
            case 0...19 : return "icono_power_blue_uno"
            case 20...39 :return "icono_power_blue_dos"
            case 40...59 :return "icono_power_blue_tres"
            case 60...79 :return "icono_power_blue_cuatro"
            case 80...100:return "icono_power_blue_cinco"
            default: return "icono_power_blue_cinco"
        }
    }
    
    var iconSpeed: String {
        switch powerstats?.speed ?? 0 {
            case 0...19 : return "icono_power_blue_uno"
            case 20...39 :return "icono_power_blue_dos"
            case 40...59 :return "icono_power_blue_tres"
            case 60...79 :return "icono_power_blue_cuatro"
            case 80...100:return "icono_power_blue_cinco"
            default: return "icono_power_blue_cinco"
        }
    }
    
    var iconDurability: String {
        switch powerstats?.durability ?? 0 {
            case 0...19 : return "icono_power_blue_uno"
            case 20...39 :return "icono_power_blue_dos"
            case 40...59 :return "icono_power_blue_tres"
            case 60...79 :return "icono_power_blue_cuatro"
            case 80...100:return "icono_power_blue_cinco"
            default: return "icono_power_blue_cinco"
        }
    }
    
    var iconPower: String {
        switch powerstats?.power ?? 0 {
            case 0...19 : return "icono_power_blue_uno"
            case 20...39 :return "icono_power_blue_dos"
            case 40...59 :return "icono_power_blue_tres"
            case 60...79 :return "icono_power_blue_cuatro"
            case 80...100:return "icono_power_blue_cinco"
            default: return "icono_power_blue_cinco"
        }
    }
    
    var iconCombat: String {
        switch powerstats?.combat ?? 0 {
            case 0...19 : return "icono_power_blue_uno"
            case 20...39 :return "icono_power_blue_dos"
            case 40...59 :return "icono_power_blue_tres"
            case 60...79 :return "icono_power_blue_cuatro"
            case 80...100:return "icono_power_blue_cinco"
            default: return "icono_power_blue_cinco"
        }
    }
    
}
