//
//  FilmData.swift
//  Swapi
//
//  Created by mac on 2020/05/15.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

struct FilmResults:Codable {
    var  results:[FilmData]
}

struct FilmData:Codable {
    var tittle:String
    var episode_id:Int
    var director:String
    var producer:String
}
