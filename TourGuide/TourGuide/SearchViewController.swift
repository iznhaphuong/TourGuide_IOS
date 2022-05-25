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
    
    var homes = [Home]()
    var homeTemplate = [Home]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//         set both delegate method in ViewDidLoad.
        tbl.delegate = self
        tbl.dataSource = self
       
        //
        searchBar.delegate = self
        // Create
        let homeImg = UIImage(named: "default")
        let homeTitle = "Ha Noi"
        let homeTitle1 = "Da Lat"
        
        homeTemplate.append(Home(homeImage: homeImg, homeTitle: homeTitle)!)
        homeTemplate.append(Home(homeImage: homeImg, homeTitle: homeTitle1)!)
        
        //Assign value second array SearchData
        homes = homeTemplate
    }
    
    // TABLE VIEW DELEGATE METHOD FUNCTION
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homes.count
    }

    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
//         Configure the cell...
        let reuseCell = "SearchTableViewCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseCell, for: indexPath) as? HomeTableViewCell {
            let home = homes[indexPath.row]
            cell.lblHomeTitle.text = home.homeTitle
            cell.imgHome.image = home.homeImage

            cell.layer.borderWidth = 1

            cell.layer.borderColor = UIColor(#colorLiteral(red:0.3, green:0.68, blue:0.97, alpha:1.0)).cgColor
            return cell

        } else {
            fatalError("Can not create the cell")
        }
    }

    //MARK:- SEARCH BAR DELEGATE METHOD FUNCTION

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        
        homes = homeTemplate
        searchBar.endEditing(true)
        tbl.reloadData()
    }

    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        homes = searchText.isEmpty ? homeTemplate : homeTemplate.filter {
            (item: Home) -> Bool in
                    // If dataItem matches the searchText, return true to include it
            return item.homeTitle.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }

        tbl.reloadData()
    }
    

}
