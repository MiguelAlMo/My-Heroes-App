//
//  ApiService.swift
//  HeroePersonal
//
//  Created by Miguel Alarcon on 10/3/21.
//

import Foundation
import Alamofire

let apiToken = "10222749016505620"
let baseURL = {
    String.init(format: "https://superheroapi.com/api/%@",
                arguments: [apiToken])
}()

let apiCharacterIdUrl = "/%@"
let apiPowerstatsUrl = "/%@/powerstats"
let apiBiographyUrl = "/%@/biography"
let apiAppearanceUrl = "/%@/appearance"
let apiWorkUrl = "/%@/work"
let apiConnectionsUrl = "/%@/connections"
let apiImagesUrl = "/%@/image"
let apiSearchUrl = "/search/%@"


enum ServiceResult {
    case success(data: Any?)
    case failure(error: String?)
}

typealias ServiceCompletion = (_ result: ServiceResult) -> ()


class ApiService {
    // MARK: - Singleton -
    static let shared = {
        ApiService()
    }()
    
    private init() {}
    
    
    // MARK: - Services -
    func fetchHero(by id: String, completion: @escaping ServiceCompletion) {
        let urlCharacterId = String.init(format: apiCharacterIdUrl,
                                         arguments: [id])
        
        AF.request("\(baseURL)\(urlCharacterId)",
                   method: .get,
                   encoding: URLEncoding.default).responseDecodable { (response: DataResponse<HeroDTO, AFError>) in
                    if let error = response.error {
                        completion(.failure(error: error.localizedDescription))
                    } else {
                        completion(.success(data: response.value))
                    }
        }
    }
    
    func searchHero(by name: String, completion: @escaping ServiceCompletion) {
        let urlSearchName = String.init(format: apiSearchUrl,
                                        arguments: [name])
        
        AF.request("\(baseURL)\(urlSearchName)",
                   method: .get,
                   encoding: URLEncoding.default).responseDecodable { (response: DataResponse<HeroDTO, AFError>) in
                    if let error = response.error {
                        completion(.failure(error: error.localizedDescription))
                    } else {
                        completion(.success(data: response.value?.name))
                    }
        }
    }
}

