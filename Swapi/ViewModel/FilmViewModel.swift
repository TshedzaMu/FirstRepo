//
//  FilmViewModel.swift
//  Swapi
//
//  Created by mac on 2020/05/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class FilmViewModel {
    
  var filmData : [FilmData] = []
           
func getData(completed: @escaping () ->())  {

        let url = URL(string: "https://swapi.dev/api/films")
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
                    let filmTiltle = jsonDetailData["title"] as! String
                    let filmEpisodeId = jsonDetailData["episode_id"] as! Int
                    let filmDirector = jsonDetailData["director"] as! String
                    let filmProducer = jsonDetailData["producer"] as! String
                    let tempData = FilmData(title: filmTiltle, episode_id:filmEpisodeId, director: filmDirector, producer: filmProducer)
                    self.filmData.append(tempData)
                print("Film tempdata",tempData)
                }

            }

            } catch {
                print(error)
            }
        }
    }.resume()

  }

}
