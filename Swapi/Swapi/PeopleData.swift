//
//  PeopleInformation.swift
//  Swapi
//
//  Created by mac on 2020/05/15.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation


struct PeopleData:Decodable {
    
    let name: String
    let height: Int
    let mass: Int
}
