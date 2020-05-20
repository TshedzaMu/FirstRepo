//
//  PlanetViewModel.swift
//  Swapi
//
//  Created by mac on 2020/05/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class PlanetViewModel {
    
 var planetData : [PlanetData] = []
               
func getData(completed: @escaping () ->())  {

            let url = URL(string: "https://swapi.dev/api/planets")
            let sessionCongfig = URLSession.shared
            let _: Void = sessionCongfig.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                print(data)
                    //            print(response) // Response even return the URL that was called
            do {
                                    // JSON Parsing
                let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                let userDataArr = jsonData?["results"] as!  [[String: Any]]

                               //  print(userDataArr)
                for jsonDetailData in userDataArr {
                    DispatchQueue.main.async {
                        completed()
                                            
                        print(jsonDetailData.count)
                        let planetName = jsonDetailData["name"] as! String
                        let rotation_period = jsonDetailData["rotation_period"] as! String
                        let diameter = jsonDetailData["diameter"] as! String
                        let climate = jsonDetailData["climate"] as! String
                        let population = jsonDetailData["population"] as! String
                        let tempData = PlanetData(name: planetName, rotation_Period: rotation_period, diameter: diameter, climate: climate, population: population)
                        self.planetData.append(tempData)
                    print("Planet tempdata",tempData)
                    }

                }

                } catch {
                    print(error)
                }
            }
        }.resume()

      }

    
    

}
