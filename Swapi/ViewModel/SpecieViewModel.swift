//
//  sepcieViewModel.swift
//  Swapi
//
//  Created by mac on 2020/05/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class SpecieViewModel {
    
     var specieData : [SpecieData] = []
                   
    func getData(completed: @escaping () ->())  {

        let url = URL(string: "https://swapi.dev/api/species")
        let sessionCongfig = URLSession.shared
        let _: Void = sessionCongfig.dataTask(with: url!) { (data, response, error) in
        if let data = data {
            print(data)
             //print(response) // Response even return the URL that was called
        do {
                                        // JSON Parsing
            let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            let userDataArr = jsonData?["results"] as!  [[String: Any]]

                                   //  print(userDataArr)
            for jsonDetailData in userDataArr {
                DispatchQueue.main.async {
                    completed()
                                                
                    print(jsonDetailData.count)
                    let specieName = jsonDetailData["name"] as! String
                    let classification  = jsonDetailData["classification"] as! String
                    let designation  = jsonDetailData["designation"] as! String
                    let average_height  = jsonDetailData["average_height"] as! String
                    let language  = jsonDetailData["language"] as! String
                    let tempData = SpecieData(name: specieName, classification: classification, designation: designation, average_height: average_height, language: language)
                            self.specieData.append(tempData)
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
