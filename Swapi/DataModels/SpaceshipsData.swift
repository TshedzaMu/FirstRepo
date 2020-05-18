//
//  SpaceshipsData.swift
//  Swapi
//
//  Created by mac on 2020/05/15.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation


struct SpaceshipsResults: Codable {
    var results:[SpaceshipData]
}

struct SpaceshipData: Codable{
    
    var name: String
    var manufucturer: String
    var passengers: Int
    var startship_class: String
}
