//
//  Hero.swift
//  doghero-test
//
//  Created by Julio Fernandes on 03/02/18.
//  Copyright © 2018 doghero. All rights reserved.
//

import UIKit
import Mapper

struct HeroGroup: Mappable {
    let recents: [Hero]
    let favorites: [Hero]
    
    init(map: Mapper) throws {
        recents = map.optionalFrom("recents") ?? []
        favorites = map.optionalFrom("favorites") ?? []
    }
}

struct Hero: Mappable {
    let addressNeighborhood: String
    let isSuperhero: Bool
    let price: Double
    let user: User
    
    init(map: Mapper) throws {
        try addressNeighborhood = map.from("address_neighborhood")
        try isSuperhero = map.from("is_superhero")
        try price = map.from("price")
        try user = map.from("user")
    }
}

struct User: Mappable {
    let firstName: String
    let imageUrl: URL
    
    init(map: Mapper) throws {
        try firstName = map.from("first_name")
        try imageUrl = map.from("image_url", transformation: convertibleToURL)
    }
}

/// Converte objeto em URL
///
/// - Parameter object: Any
/// - Returns: url type
/// - Throws: convertibleError
func convertibleToURL(object: Any?) throws -> URL {
    guard let path = object as? String else {
        throw MapperError.convertibleError(value: object, type: String.self)
    }
    
    if let pathURL = URL(string: path) {
        return pathURL
    }
    
    throw MapperError.customError(field: nil, message: "Couldn't split the string!")
}
