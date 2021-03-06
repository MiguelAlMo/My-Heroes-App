//
//  HeoresType.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 1/3/21.
//

import Foundation

/// Hero type `marvel`, `dc` or `all`
enum HeroesType: String, Codable {
    case marvel = "Marvel Comics"
    case dc = "DC Comics"
    case all = ""
}
