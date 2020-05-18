//
//  ViewController.swift
//  Swapi
//
//  Created by mac on 2020/05/14.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
  

       fileprivate var peopleViewModel = PeopleViewModel()
    
    
    @IBOutlet weak var starWarsInformationTableView: UITableView!
    
    lazy var informationToDisplay = 0
    
    override func viewDidLoad() {
           super.viewDidLoad()
          
           starWarsInformationTableView.delegate = self
           starWarsInformationTableView.dataSource = self
        
        peopleViewModel.getData(){
            
        }
           
       }
       
    
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
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleViewModel.peopleData.count
    
         // return searchViewModel.data.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        var cell: UITableViewCell!
//
//        if informationToDisplay == 0
//        {
//            cell = tableView.dequeueReusableCell(withIdentifier: "CID_PlanetCell", for: indexPath) as! PlanetTableViewCell
//
//
//
//        } else if informationToDisplay == 1
//        {
//             cell = tableView.dequeueReusableCell(withIdentifier: "CID_SpaceshipCell", for: indexPath) as! SpaceshipTableViewCell
//        }else if informationToDisplay == 2
//        {
//             cell = tableView.dequeueReusableCell(withIdentifier: "CID_VehicleCell", for: indexPath) as! VehicleTableViewCell
//        }
//        else if informationToDisplay == 3
//        {
//             cell = tableView.dequeueReusableCell(withIdentifier: "CID_PeopleCell", for: indexPath) as! PeopleTableViewCell
//             // cell.PeopleNameLabel.text = "Tshedza"
//
//
//
//
//
//        }else if informationToDisplay == 4
//        {
//             cell = tableView.dequeueReusableCell(withIdentifier: "CID_FilmCell", for: indexPath) as! FilmTableViewCell
//
//
//
//        }else if informationToDisplay == 5
//        {
//             cell = tableView.dequeueReusableCell(withIdentifier: "CID_SpecieCell", for: indexPath) as! SpaceshipTableViewCell
//        }
        
        var  cell = tableView.dequeueReusableCell(withIdentifier: "CID_PeopleCell", for: indexPath) as! PeopleTableViewCell
        
        cell.PeopleNameLabel.text = "Name: " + peopleViewModel.peopleData[indexPath.row].name
        cell.PeopleHeightLabel.text = "Height: " + peopleViewModel.peopleData[indexPath.row].height
        cell.PeopleMassLabel.text = "Mass: "+peopleViewModel.peopleData[indexPath.row].mass
       // cell.PeopleNameLabel.text = peopleViewModel.peopleData[indexPath.row].name
        
        
        return cell
        
      }
    
    

    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        var cellHeight = CGFloat()
              
              if informationToDisplay == 0 {
                cellHeight = 150
              } else if informationToDisplay == 1 {
                  cellHeight = 150
              } else if informationToDisplay == 2 {
                  cellHeight = 150
              } else if informationToDisplay == 3 {
                cellHeight = 150
              } else if informationToDisplay == 4 {
                   cellHeight = 150
              } else if informationToDisplay == 5 {
                  cellHeight = 150
              }
                return cellHeight

    }
  
}

