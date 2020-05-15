//
//  VehicleData.swift
//  Swapi
//
//  Created by mac on 2020/05/15.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

struct VehicleData: Decodable{
    let name:String
    let model:String
    let manufucturer:String
    let cost_in_credits:Int
    let crew:Int
}
