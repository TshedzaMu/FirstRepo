//
//  ViewController.swift
//  Swapi
//
//  Created by mac on 2020/05/14.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
  
    @IBOutlet weak var starWarsInformationTableView: UITableView!
    
    
    var people = [PeopleInformation]()
    
    @IBAction func searchSegment(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
           print("Planets")
            informationToDisplay = 0
            case 1:
            print("ships")
            informationToDisplay = 1
            case 2:
           print("vehicles")
            informationToDisplay = 2
            case 3:
           print("people")
            informationToDisplay = 3
            case 4:
           print("films")
            informationToDisplay = 4
           
            
            default:
            print("Species")
            informationToDisplay = 5
            
            
        }
        starWarsInformationTableView.reloadData()
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        starWarsInformationTableView.delegate=self
        starWarsInformationTableView.dataSource=self
        
        getSarWarsInfromationJSON {
            print("Good")
        }
        
    }
    
    lazy var informationToDisplay = 0
    
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if informationToDisplay == 0
        {
            cell = tableView.dequeueReusableCell(withIdentifier: "CID_PlanetCell", for: indexPath)
            
        } else if informationToDisplay == 1
        {
             cell = tableView.dequeueReusableCell(withIdentifier: "CID_SpaceshipCell", for: indexPath)
        }else if informationToDisplay == 2
        {
             cell = tableView.dequeueReusableCell(withIdentifier: "CID_VehicleCell", for: indexPath)
        }
        else if informationToDisplay == 3
        {
             cell = tableView.dequeueReusableCell(withIdentifier: "CID_PeopleCell", for: indexPath)
        }else if informationToDisplay == 4
        {
             cell = tableView.dequeueReusableCell(withIdentifier: "CID_FilmCell", for: indexPath)
        }else if informationToDisplay == 5
        {
             cell = tableView.dequeueReusableCell(withIdentifier: "CID_SpecieCell", for: indexPath)
        }
        
        return cell
        
      }
    
    
    func getSarWarsInfromationJSON(completed: @escaping () -> ()){
        
        let url = URL(string: "https://swapi.dev/api/people/")
        
        URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            if error == nil {
                do {
                    self.people = try JSONDecoder().decode([PeopleInformation].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                    
                    
                } catch {
                    print("JSON Error")
                }
                
            }
            
            
        }.resume()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        
        
        
    }
    
    
}

