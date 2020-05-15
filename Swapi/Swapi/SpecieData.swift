//
//  SpecieData.swift
//  Swapi
//
//  Created by mac on 2020/05/15.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

struct SpecieData:Decodable {
    let name:String
    let classification:String
    let designation:String
    let average_height:Int
    let language: String
}
