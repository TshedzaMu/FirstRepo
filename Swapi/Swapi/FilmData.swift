//
//  FilmData.swift
//  Swapi
//
//  Created by mac on 2020/05/15.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
struct FilmData:Decodable {
    let tittle:String
    let episode_id:Int
    let director:String
    let producer:String
}
