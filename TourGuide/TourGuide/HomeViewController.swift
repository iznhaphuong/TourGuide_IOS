//
//  HomeViewController.swift
//  TourGuide
//
//  Created by Khanh on 27/05/2022.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sideMenuBtn: UIBarButtonItem!
    @IBOutlet weak var tbl: UITableView!
    
    var myIndex = 0
    var homes = Database.cities
    
    enum NavagationType {
        case home
        case tour
    }
    
    var navigationType:NavagationType = .home

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Side Menu
        
        self.navigationController!.navigationBar.barStyle = .black
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = .white
        sideMenuBtn.target = revealViewController()
        sideMenuBtn.action = #selector(revealViewController()?.revealSideMenu)
        
        
        //set both delegate method in ViewDidLoad.
        tbl.delegate = self
        tbl.dataSource = self
//        tbl.backgroundColor = UIColor(#colorLiteral(red:0.3, green:0.68, blue:0.97, alpha:1.0))
//        tbl.separatorStyle = .none
        let myCustomSelectionColorView = UIView()
        myCustomSelectionColorView.backgroundColor = .white
        tbl.backgroundView = myCustomSelectionColorView
        

        //color background
//        self.tableView.backgroundColor = UIColor(#colorLiteral(red:0.3, green:0.68, blue:0.97, alpha:1.0))
//        let myCustomSelectionColorView = UIView()
//        myCustomSelectionColorView.backgroundColor = .white
//        self.tableView.backgroundView = myCustomSelectionColorView


        // Create
//        let homeImg = UIImage(named: "default")
//        let homeTitle = "Hà Nội"
//        let homeTitle1 = "Da Lat"
//        if let home = Home(homeImage: homeImg, homeTitle: homeTitle) {
//            homes += [home]
//        }
//        if let home = Home(homeImage: homeImg, homeTitle: homeTitle1) {
//            homes += [home]
//        }
        
        // register TableView Cell
        self.tbl.register(HomeCell.nib, forCellReuseIdentifier: HomeCell.identifier)
        
        // Update TableView with the data
        self.tbl.reloadData()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return homes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
//        let reuseCell = "HomeCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell {
            let home = homes[indexPath.row]
            cell.configure(with: home)
            
            return cell
            
        } else {
            fatalError("Can not create the cell")
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        tbl.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "homeTour", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let segueIdentifier = segue.identifier {
            switch segueIdentifier {
            case "home":
                navigationType = .home
                if let destiantionController = segue.destination as? SearchViewController {
                    destiantionController.navigationType = .home
                    destiantionController.homeTemplate = homes
                }
            case "homeTour":
                if let destinationController = segue.destination as? TourTableViewController {
                    let home = homes[myIndex]
                    destinationController.tours = Database.getTour(id: home.id)
                    destinationController.idCity = home.id
                }
                
            default:
                break
            }
        }
    }
}
