//
//  PlanetData.swift
//  Swapi
//
//  Created by mac on 2020/05/15.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

struct PlanetData: Decodable{
    
    let  name: String
    let  rotation_Period: String
    let  diameter: Int
    let  climate: String
    let  population: Int
}
