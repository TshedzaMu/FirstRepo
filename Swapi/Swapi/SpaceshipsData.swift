//
//  SpaceshipsData.swift
//  Swapi
//
//  Created by mac on 2020/05/15.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

struct SpaceshipData: Decodable{
    let name: String
    let manufucturer: String
    let passengers: Int
    let startship_class: String
}
