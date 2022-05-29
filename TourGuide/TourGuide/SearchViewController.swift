//
//  SearchViewController.swift
//  TourGuide
//
//  Created by Khanh on 24/05/2022.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tbl: UITableView!
    
    var myIndex = 0
    
    var homes = [Home]()
    var homeTemplate = [Home]()
    
    var tours = [Tour]()
    var tourTemplate = [Tour]()
    
    enum NavigationType {
        case home
        case tour
    }
    
    var navigationType:NavigationType = .home

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

//         set both delegate method in ViewDidLoad.
        tbl.delegate = self
        tbl.dataSource = self
        tbl.backgroundColor = .white
        tbl.separatorStyle = .none
       
        //
        searchBar.delegate = self
        
        switch navigationType {
        case .home:
            print("home didLoad")
            // Create
//            let homeImg = UIImage(named: "default")
//            let homeTitle = "Ha Noi"
//            let homeTitle1 = "Da Lat"

//            homeTemplate.append(Home(homeImage: homeImg, homeTitle: homeTitle)!)
//            homeTemplate.append(Home(homeImage: homeImg, homeTitle: homeTitle1)!)

            //Assign value second array SearchData
            homes = homeTemplate

            // set
            tbl.rowHeight = 102

            // register TableView Cell
            self.tbl.register(HomeCell.nib, forCellReuseIdentifier: HomeCell.identifier)
        case .tour:
            // Create
//            let tourImg = UIImage(named: "default")
//            let tourTitle = "Ha Noi Rat dep"
//            let ratingValur = 4
//            let tourTitle1 = "Da Lat Len La Co"
//            let ratingValue1 = 5
//
//            tourTemplate.append(Tour(tourImage: tourImg, tourTitle: tourTitle, ratingValue: ratingValur)!)
//            tourTemplate.append(Tour(tourImage: tourImg, tourTitle: tourTitle1, ratingValue: ratingValue1)!)

            //Assign value second array SearchData
            tours = tourTemplate

            // set
            tbl.rowHeight = 177

            // register TableView Cell
            self.tbl.register(TourCell.nib, forCellReuseIdentifier: TourCell.identifier)
        }



        // Update TableView with the data
        self.tbl.reloadData()
    }
    
    // TABLE VIEW DELEGATE METHOD FUNCTION
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch navigationType {
        case .home:
            return homes.count
        case .tour:
            return tours.count
        }
    }

    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
//         Configure the cell...
        switch navigationType {
        case .home:
            if let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell {
                let home = homes[indexPath.row]
                cell.imgLogo.image = home.homeImage
                cell.lblTitle.text = home.homeTitle

                cell.layer.borderWidth = 1

                cell.layer.borderColor = UIColor(#colorLiteral(red:0.3, green:0.68, blue:0.97, alpha:1.0)).cgColor
                return cell

            } else {
                fatalError("Can not create the cell")
            }
        case .tour:
            if let cell = tableView.dequeueReusableCell(withIdentifier: TourCell.identifier, for: indexPath) as? TourCell {
                let tour = tours[indexPath.row]
                cell.lblTourTitle.text = tour.tourTitle
                cell.imgTour.image = tour.tourImage
                cell.tourRatingControl.setRatingValue(tour.ratingValue)

                cell.layer.borderWidth = 1

                cell.layer.borderColor = UIColor(#colorLiteral(red:0.3, green:0.68, blue:0.97, alpha:1.0)).cgColor
                return cell

            } else {
                fatalError("Can not create the cell")
            }
        }
        
    }

    //MARK:- SEARCH BAR DELEGATE METHOD FUNCTION

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        
        switch navigationType {
        case .home:
            homes = homeTemplate
        case .tour:
            tours = tourTemplate
        }
        searchBar.endEditing(true)
        tbl.reloadData()
    }

    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        switch navigationType {
        case .home:
            homes = searchText.isEmpty ? homeTemplate : homeTemplate.filter {
                (item: Home) -> Bool in
                        // If dataItem matches the searchText, return true to include it
                return item.homeTitle.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            }
        case .tour:
            tours = searchText.isEmpty ? tourTemplate : tourTemplate.filter {
                (item: Tour) -> Bool in
                        // If dataItem matches the searchText, return true to include it
                return item.tourTitle.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
            }
        }

        tbl.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        tbl.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "searTour", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueIdentifier = segue.identifier {
            switch segueIdentifier {
            case "searTour":
                if let destinationController = segue.destination as? TourTableViewController {
                    let home = homes[myIndex]
                    destinationController.data = Tour(tourImage: home.homeImage, tourTitle: home.homeTitle, ratingValue: 4)
                }
            default:
                break
            }
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
}
