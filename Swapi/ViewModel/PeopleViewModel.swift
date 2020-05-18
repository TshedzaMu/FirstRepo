//
//  PeopleViewModel.swift
//  Swapi
//
//  Created by mac on 2020/05/18.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class PeopleViewModel{
    
  var peopleData : [PeopleData] = []
    
    
func getData(completed: @escaping () ->())  {

    let url = URL(string: "https://swapi.dev/api/people")
    let sessionCongfig = URLSession.shared
    let task: Void = sessionCongfig.dataTask(with: url!) { (data, response, error) in
    if let data = data {
            print(data)
         //            print(response) // Response even return the URL that was called
            do {
                         // JSON Parsing
                let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    var userDataArr = jsonData?["results"] as!  [[String: Any]]

                    //  print(userDataArr)
                    for jsonDetailData in userDataArr {
                     DispatchQueue.main.async {
                        completed()
                                 
                        print(jsonDetailData.count)
                        let name = jsonDetailData["name"] as! String
                        let height = jsonDetailData["height"] as! String
                        let  mass = jsonDetailData["mass"] as! String
                        let tempData = PeopleData(name: name, height: height, mass: mass)
                        self.peopleData.append(tempData)
                            print("tempdata",tempData)
                             }
                         }

                     } catch {
                       //  print(error)
                     }
                 }
             }.resume()

     }
     
    

}
