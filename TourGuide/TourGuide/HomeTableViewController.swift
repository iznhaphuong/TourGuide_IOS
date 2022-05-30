 //
//  HomeTableViewController.swift
//  TourGuide
//
//  Created by Khanh on 22/05/2022.
//

import UIKit

class HomeTableViewController: UITableViewController {
    //MARK: Properties
    @IBOutlet var sideMenuBtn: UIBarButtonItem!
    @IBOutlet var tbl: UITableView!
    
    var myIndex = 0
    var homes = [City]()
    
    enum NavagationType {
        case home
        case tour
    }
    
    var navigationType:NavagationType = .home
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tat cu chi
        self.sideMenuBtn.target = revealViewController()
        self.sideMenuBtn.action = #selector(self.revealViewController()?.revealSideMenu)
        
        //color background
        self.tableView.backgroundColor = UIColor(#colorLiteral(red:0.3, green:0.68, blue:0.97, alpha:1.0))
        let myCustomSelectionColorView = UIView()
        myCustomSelectionColorView.backgroundColor = .white
        self.tableView.backgroundView = myCustomSelectionColorView
        
        
        
        // Side Menu
        navigationController?.navigationBar.tintColor = .black

        sideMenuBtn.target = revealViewController()
        sideMenuBtn.action = #selector(revealViewController()?.revealSideMenu)

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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return homes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        tbl.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "homeTour", sender: self)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
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
