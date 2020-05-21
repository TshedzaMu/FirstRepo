//
//  PlanetData.swift
//  Swapi
//
//  Created by mac on 2020/05/15.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

struct PlanetData: Codable{
    
    var  name: String
    var  rotation_Period: String
    var  diameter: String
    var climate: String
    var population: String
}

struct SpaceshipData: Codable{
    
    var name: String
    var manufucturer: String
    var crew: String
    var passengers: String
    var cargo_capacity :String
}

struct VehicleData: Codable{
    var name:String
    var model:String
    var manufucturer:String
    var cost_in_credits:String
    var crew:String
}


struct PeopleData{
    
    var name: String
    var height: String
    var mass: String
    var gender:String
    var birthYear:String
}

struct SpecieData:Codable {
    var name:String
    var classification:String
    var designation:String
    var average_height:String
    var language: String
}

struct FilmData:Codable {
    var title:String
    var episode_id:Int
    var director:String
    var producer:String
    var release_date:String
}

