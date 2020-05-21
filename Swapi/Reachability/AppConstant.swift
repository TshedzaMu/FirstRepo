//
//  AppConstant.swift
//  Swapi
//
//  Created by mac on 2020/05/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation


enum SelectedSegment:Int {
    case planets = 0
    case starships
    case vehicles
    case people
    case films
    case species
    
    var selectedSegmentType: String{
        get {return String(describing: self)}
    }
}


let ACTIVITY_INDICATOR_TAG = 001

