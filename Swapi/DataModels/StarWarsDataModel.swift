//
//  PlanetData.swift
//  Swapi
//
//  Created by mac on 2020/05/15.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

struct PlanetData {
    
    var name: String
    var rotationPeriod: String
    var diameter: String
    var climate: String
    var population: String
}

struct SpaceshipData {
    
    var name: String
    var manufucturer: String
    var crew: String
    var passengers: String
    var cargoCapacity :String
}

struct VehicleData {
    var name:String
    var model:String
    var manufucturer:String
    var costInCredits:String
    var crew:String
}


struct PeopleData{
    
    var name: String
    var height: String
    var mass: String
    var gender:String
    var birthYear:String
}

struct SpecieData {
    var name:String
    var classification:String
    var designation:String
    var averageHeight:String
    var language: String
}

struct FilmData {
    var title:String
    var episodeId:Int
    var director:String
    var producer:String
    var releaseDate:String
}

