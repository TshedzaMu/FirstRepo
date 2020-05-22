//
//  PlanetViewModel.swift
//  Swapi
//
//  Created by mac on 2020/05/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class SearchStarWarsViewModel {
    
    var planetData : [PlanetData] = []
    var spaceshipData : [SpaceshipData] = []
    var vehicleData : [VehicleData] = []
    var peopleData : [PeopleData] = []
    var filmData : [FilmData] = []
    var specieData : [SpecieData] = []
    
    
    var filterPlanetData : [PlanetData] = []
    var filterSpaceshipData : [SpaceshipData] = []
    var filterVehicleData : [VehicleData] = []
    var filterPeopleData : [PeopleData] = []
    var filterFilmData : [FilmData] = []
    var filterSpecieData : [SpecieData] = []
    
    
    func getData(searchType:SelectedSegment ,completed: @escaping () ->())  {
        
        let baseUrl = "https://swapi.dev/api/"
        let urlString = baseUrl + searchType.selectedSegmentType
        //  let urlString = baseUrl + searchType
        let url = URL(string: urlString)
        let sessionCongfig = URLSession.shared
        let _: Void = sessionCongfig.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                
                do {
                    
                    let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    let userDataArr = jsonData?["results"] as!  [[String: Any]]
                    
                    
                    for jsonDetailData in userDataArr {
                        DispatchQueue.main.async {
                            completed()
                            
                            switch searchType {
                                
                            case .planets:
                                
                                let planetName = jsonDetailData["name"] as! String
                                let rotation_period = jsonDetailData["rotation_period"] as! String
                                let diameter = jsonDetailData["diameter"] as! String
                                let climate = jsonDetailData["climate"] as! String
                                let population = jsonDetailData["population"] as! String
                                let tempData = PlanetData(name: planetName, rotationPeriod: rotation_period, diameter: diameter, climate: climate, population: population)
                                self.planetData.append(tempData)
                                self.filterPlanetData.append(tempData)
                                
                            case .starships:
                                
                                let name = jsonDetailData["name"] as! String
                                let manufucturer = jsonDetailData["manufacturer"] as! String
                                let crew = jsonDetailData["crew"] as! String
                                let passengers = jsonDetailData["passengers"] as! String
                                let cargo_capacity = jsonDetailData["cargo_capacity"] as! String
                                let tempData = SpaceshipData(name: name, manufucturer: manufucturer,crew: crew, passengers: passengers, cargoCapacity: cargo_capacity)
                                self.spaceshipData.append(tempData)
                                self.filterSpaceshipData.append(tempData)
                                
                                
                                
                            case .vehicles:
                                
                                let name = jsonDetailData["name"] as! String
                                let model = jsonDetailData["model"] as! String
                                let manufucturer = jsonDetailData["manufacturer"] as! String
                                let cost = jsonDetailData["cost_in_credits"] as! String
                                let crew = jsonDetailData["crew"] as! String
                                let tempData = VehicleData(name: name, model: model, manufucturer:manufucturer,costInCredits: cost,crew: crew)
                                self.vehicleData.append(tempData)
                                self.filterVehicleData.append(tempData)
                                
                            case .people:
                                let name = jsonDetailData["name"] as! String
                                let height = jsonDetailData["height"] as! String
                                let  mass = jsonDetailData["mass"] as! String
                                let  gender = jsonDetailData["gender"] as! String
                                let  birthYear = jsonDetailData["birth_year"] as! String
                                let tempData = PeopleData(name: name, height: height, mass: mass,gender:gender,birthYear: birthYear )
                                self.peopleData.append(tempData)
                                self.filterPeopleData.append(tempData)
                                
                                
                            case .films:
                                
                                let filmTiltle = jsonDetailData["title"] as! String
                                let filmEpisodeId = jsonDetailData["episode_id"] as! Int
                                let filmDirector = jsonDetailData["director"] as! String
                                let filmProducer = jsonDetailData["producer"] as! String
                                let filmReleaseDate = jsonDetailData["release_date"] as! String
                                let tempData = FilmData(title: filmTiltle, episodeId:filmEpisodeId, director: filmDirector, producer: filmProducer,releaseDate: filmReleaseDate)
                                self.filmData.append(tempData)
                                self.filterFilmData.append(tempData)
                                
                                
                                
                            case .species:
                                
                                let specieName = jsonDetailData["name"] as! String
                                let classification  = jsonDetailData["classification"] as! String
                                let designation  = jsonDetailData["designation"] as! String
                                let average_height  = jsonDetailData["average_height"] as! String
                                let language  = jsonDetailData["language"] as! String
                                let tempData = SpecieData(name: specieName, classification: classification, designation: designation, averageHeight: average_height, language: language)
                                self.specieData.append(tempData)
                                self.filterSpecieData.append(tempData)
                                
                            }
            
                        }
                        
                    }
                    
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    
    func filterTableView(sortType:SelectedSegment , index:Int, text:String)
    {
        if sortType == .planets {
            
            if text == "" {
                planetData = filterPlanetData
            } else {
                planetData = filterPlanetData.filter({ (data) -> Bool in
                    return data.name.contains(text)
                })
            }
        }else if sortType == .starships {
            if text == "" {
                spaceshipData = filterSpaceshipData
            } else {
                spaceshipData = filterSpaceshipData.filter({ (data) -> Bool in
                    return data.name.contains(text)
                })
            }
        }else if sortType == .vehicles {
            if text == "" {
                vehicleData = filterVehicleData
            } else {
                vehicleData = filterVehicleData.filter({ (data) -> Bool in
                    return data.name.contains(text)
                })
            }
        }else if sortType == .people {
            if text == "" {
                peopleData = filterPeopleData
            } else {
                peopleData = filterPeopleData.filter({ (data) -> Bool in
                    return data.name.contains(text)
                })
            }
            
        }else if sortType == .films {
            if text == "" {
                filmData = filterFilmData
            }else{
                filmData = filterFilmData.filter({ (data) -> Bool in
                    return data.title.contains(text)
                })
            }
            
        }else if sortType == .species {
            if text == "" {
                specieData =  filterSpecieData
            } else {
                specieData = filterSpecieData.filter({ (data) -> Bool in
                    return data.name.contains(text)
                })
            }
        }
    }
}
