//
//  SpaceshipViewModel.swift
//  Swapi
//
//  Created by mac on 2020/05/19.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class SpaceshipViewModel {
    
    var spaceshipData : [SpaceshipData] = []
        
        
    func getData(completed: @escaping () ->())  {

        let url = URL(string: "https://swapi.dev/api/vehicles")
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
                            let name = jsonDetailData["name"] as! String
                         //   let model = jsonDetailData["model"] as! String
                            let manufucturer = jsonDetailData["manufacturer"] as! String
                            let crew = jsonDetailData["crew"] as! String
                            let passengers = jsonDetailData["passengers"] as! String
                            let cargo_capacity = jsonDetailData["cargo_capacity"] as! String
                            let tempData = SpaceshipData(name: name, manufucturer: manufucturer,crew: crew, passengers: passengers, cargo_capacity: cargo_capacity)
                            self.spaceshipData.append(tempData)
                                print("Spaceship tempdata",tempData)
                                 }

                             }

                         } catch {
                            print(error)
                         }
                     }
                 }.resume()

         }
    
    

}
