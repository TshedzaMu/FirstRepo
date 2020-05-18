//
//  PlanetData.swift
//  Swapi
//
//  Created by mac on 2020/05/15.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation


struct PlanetDataResults:Codable {
    var results: [PlanetData]
}

struct PlanetData: Codable{
    
    var  name: String
    var  rotation_Period: String
    var  diameter: Int
    var climate: String
    var population: Int
}
