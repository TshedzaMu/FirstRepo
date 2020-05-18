//
//  SpecieData.swift
//  Swapi
//
//  Created by mac on 2020/05/15.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation


struct SpeciesResults:Codable {
    
    var reuslts:[SpecieData]
}

struct SpecieData:Codable {
    var name:String
    var classification:String
    var designation:String
    var average_height:Int
    var language: String
}
