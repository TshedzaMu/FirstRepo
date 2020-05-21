//
//  ViewController.swift
//  Swapi
//
//  Created by mac on 2020/05/14.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class SearchStarWarsViewController: UIViewController, UITableViewDataSource,UITableViewDelegate, UISearchBarDelegate {

    
      fileprivate var searchStarWarsViewModel = SearchStarWarsViewModel()
    
      @IBOutlet weak var starWarsInformationTableView: UITableView!
    
      @IBOutlet weak var searchSegment: UISegmentedControl!
    

    lazy var informationToDisplay = 0
    
    override func viewDidLoad() {
           super.viewDidLoad()
          
           starWarsInformationTableView.delegate = self
           starWarsInformationTableView.dataSource = self
        
           startActivityIndicator()
           searchStarWarsViewModel.getData(searchType:"planets"){
           self.reloadTabelViewWithData()
        
            }
       }

    
@IBAction func searchSegmentValueChanged(_ sender: UISegmentedControl) {
   if let segmentSelected = SelectedSegment(rawValue: searchSegment.selectedSegmentIndex){
    switch segmentSelected {
        case .planets:
            if  searchStarWarsViewModel.planetData.count > 0 {
                self.starWarsInformationTableView.reloadData()
               }else {
                startActivityIndicator()
                searchStarWarsViewModel.getData(searchType: SelectedSegment.planets.selectedSegmentType) {
                self.reloadTabelViewWithData()
                }
            }
                      
        case .starships:
                      
            if searchStarWarsViewModel.spaceshipData.count > 0 {
                self.starWarsInformationTableView.reloadData()
                    }else{
                    startActivityIndicator()
                    searchStarWarsViewModel.getData(searchType:SelectedSegment.starships.selectedSegmentType) {
                    self.reloadTabelViewWithData()
                    }
            }
                      
        case .vehicles:
                      
            if searchStarWarsViewModel.vehicleData.count > 0 {
                self.starWarsInformationTableView.reloadData()
                }else{
                startActivityIndicator()
                searchStarWarsViewModel.getData(searchType: SelectedSegment.vehicles.selectedSegmentType){
                self.reloadTabelViewWithData()
                }
            }
                      
        case .people:
                      
            if searchStarWarsViewModel.peopleData.count > 0 {
                self.starWarsInformationTableView.reloadData()
                }else{
                startActivityIndicator()
                searchStarWarsViewModel.getData(searchType: SelectedSegment.people.selectedSegmentType){
                self.reloadTabelViewWithData()
                }
            }
                      
        case .films:
                      
            if searchStarWarsViewModel.filmData.count > 0 {
            self.starWarsInformationTableView.reloadData()
            }else{
                startActivityIndicator()
                searchStarWarsViewModel.getData(searchType: SelectedSegment.films.selectedSegmentType){
                self.reloadTabelViewWithData()
                }
            }
                      
                      
            case .species:
                      
            if searchStarWarsViewModel.specieData.count > 0 {
            self.starWarsInformationTableView.reloadData()
            }else{
                startActivityIndicator()
                searchStarWarsViewModel.getData(searchType: SelectedSegment.species.selectedSegmentType){
                self.reloadTabelViewWithData()
                }
            }
        }
    }
}
    
    func reloadTabelViewWithData() {
        self.stopActivityIndicator()
        self.starWarsInformationTableView.reloadData()
    }
     
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    var noOfRows = 0
    
    if let numberOfRows = SelectedSegment(rawValue: searchSegment.selectedSegmentIndex){
      switch numberOfRows {
         case .planets:
               noOfRows = searchStarWarsViewModel.planetData.count
        case .starships:
                  noOfRows = searchStarWarsViewModel.spaceshipData.count
        case .vehicles:
           noOfRows = searchStarWarsViewModel.vehicleData.count
        case .people:
                noOfRows = searchStarWarsViewModel.peopleData.count
        case .films:
                noOfRows = searchStarWarsViewModel.filmData.count
        case .species:
             noOfRows = searchStarWarsViewModel.specieData.count
             
        }
    }
   return noOfRows
}
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
 
    
  if let numberOfRows = SelectedSegment(rawValue: searchSegment.selectedSegmentIndex){
     switch numberOfRows {
       case .planets:
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "CID_PlanetCell", for: indexPath) as! PlanetTableViewCell
            cell.palentNameLabel.text = "Planet name: " + searchStarWarsViewModel.planetData[indexPath.row].name
            cell.planetRotationPeriodLabel.text = "Rotation period " + searchStarWarsViewModel.planetData[indexPath.row].rotation_Period
            cell.planetDiameterLabel.text = "Diameter: " + searchStarWarsViewModel.planetData[indexPath.row].rotation_Period
            cell.planetClimateLabel.text = "Cliamte: " + searchStarWarsViewModel.planetData[indexPath.row].diameter
            cell.planetPopulationLabel.text = "Population: " + searchStarWarsViewModel.planetData[indexPath.row].population
        
      
         return cell
        
        case .starships:
        
           let  cell = tableView.dequeueReusableCell(withIdentifier: "CID_SpaceshipCell", for: indexPath) as! SpaceshipTableViewCell
                cell.spaceshipNameLabel.text = "Name " + searchStarWarsViewModel.spaceshipData[indexPath.row].name
                cell.spaceshipManufucturerLabel.text = "Manufucturer: " + searchStarWarsViewModel.spaceshipData[indexPath.row].manufucturer
                cell.spaceshipNumberOfCrewLabel.text = "Crew number: " + searchStarWarsViewModel.spaceshipData[indexPath.row].crew
                cell.spaceshipPassengerLabel.text = "Number of passengers: " + searchStarWarsViewModel.spaceshipData[indexPath.row].passengers
                cell.spaceshipCargoCapacityLabel.text = "Cargo capacity: " + searchStarWarsViewModel.spaceshipData[indexPath.row].cargo_capacity
        
            return cell
            
                 
        case .vehicles:
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "CID_VehicleCell", for: indexPath) as! VehicleTableViewCell
        
                cell.vehicleNameLabel.text = "Name: " + searchStarWarsViewModel.vehicleData[indexPath.row].name
                cell.vehicleManufucturerLabel.text = "Manufucturer: " + searchStarWarsViewModel.vehicleData[indexPath.row].manufucturer
                cell.vehicleModelLabel.text = "Model: " + searchStarWarsViewModel.vehicleData[indexPath.row].model
                cell.vehicleCostLabel.text = "Cost: " + searchStarWarsViewModel.vehicleData[indexPath.row].cost_in_credits
                cell.vehicleNumberOfCrewLabel.text = "Number of crew: " + searchStarWarsViewModel.vehicleData[indexPath.row].crew
        
            return cell
        
            
           
        case .people:
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "CID_PeopleCell", for: indexPath) as! PeopleTableViewCell
                cell.peopleNameLabel.text = "Name: " + searchStarWarsViewModel.peopleData[indexPath.row].name
                cell.peopleHeightLabel.text = "Height: " + searchStarWarsViewModel.peopleData[indexPath.row].height
                cell.peopleMassLabel.text = "Mass: " + searchStarWarsViewModel.peopleData[indexPath.row].mass
                cell.peopleGenderLabel.text = "Gender:" + searchStarWarsViewModel.peopleData[indexPath.row].gender
                cell.peopleNirthyearLabel.text = "Birth year:" + searchStarWarsViewModel.peopleData[indexPath.row].birthYear
            return cell
            
                 
        case .films:
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "CID_FilmCell", for: indexPath) as! FilmTableViewCell
                cell.movieTitleLabel.text = "Film title: " + searchStarWarsViewModel.filmData[indexPath.row].title
                cell.movieIdLabel.text = "Film number: \(searchStarWarsViewModel.filmData[indexPath.row].episode_id)"
                cell.movieDirectorNameLabel.text = "Director: " + searchStarWarsViewModel.filmData[indexPath.row].director
                cell.movieProducerNameLabel.text = "Producer: " + searchStarWarsViewModel.filmData[indexPath.row].producer
                cell.releasedateLabel.text = "Release date: " + searchStarWarsViewModel.filmData[indexPath.row].release_date
          return cell
        
            
                 
        case .species:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CID_SpecieCell", for: indexPath) as! SpecieTableViewCell
                cell.specieNameLabel.text = "Name: " + searchStarWarsViewModel.specieData[indexPath.row].name
                cell.specieClassificationLabel.text = "Classification: " + searchStarWarsViewModel.specieData[indexPath.row].classification
                cell.specieDesignationLabel.text = "Designation: " + searchStarWarsViewModel.specieData[indexPath.row].designation
                cell.aspecieAverageHeightLabel.text = "Average height: " + searchStarWarsViewModel.specieData[indexPath.row].average_height
                cell.specieLanguageLabel.text = "Language: " + searchStarWarsViewModel.specieData[indexPath.row].language
        
            return cell
            
          }
      }
    return UITableViewCell()
}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
{
    let cellHeight = 140.0
    return CGFloat(cellHeight)}
    
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
  {
      if searchText.isEmpty {
          searchBar.resignFirstResponder()
          searchBar.endEditing(true)
        
          
      }
      if let selectedSegement = SelectedSegment(rawValue: searchSegment.selectedSegmentIndex){
          searchStarWarsViewModel.filterTableView(sortType: selectedSegement, index: searchBar.selectedScopeButtonIndex, text: searchText)
          self.starWarsInformationTableView.reloadData()
      }
  }}

