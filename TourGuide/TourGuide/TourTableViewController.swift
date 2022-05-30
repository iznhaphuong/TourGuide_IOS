//
//  TourTableViewController.swift
//  TourGuide
//
//  Created by Khanh on 22/05/2022.
//

import UIKit

class TourTableViewController: UITableViewController {
    //MARK: Properties
//    var tourists = [Tour]()
    var tours:[Tour]!
    var idCity:Int!
    
//    @IBOutlet weak var sideMenuBtn: UIBarButtonItem!
    @IBOutlet var tbl: UITableView!
    
    enum NavagationType {
        case home
        case tour
    }
    
    var navigationType:NavagationType = .tour
    
//    var data:Tour!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        // Side Menu
//        navigationController?.navigationBar.prefersLargeTitles = true

        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .blue
        navigationController?.navigationBar.barStyle = .black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.tintColor = UIColor(#colorLiteral(red:12, green:122, blue:255, alpha:1.0))
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

        // Create
//        let tourImage = UIImage(named: "default")
//        let toutTitle = "Ha Noi Rat Dep"
//        let ratingValue = 5
//        let tourTitle1 = "Da Lat Len La Co"
//        let ratingValue1 = 5
//        if let tour = Tour(tourImage: tourImage, tourTitle: toutTitle, ratingValue: ratingValue) {
//            tourists += [tour]
//        }
//        if let tour = Tour(tourImage: tourImage, tourTitle: tourTitle1, ratingValue: ratingValue1) {
//            tourists += [tour]
//        }
        
        self.title = Database.getNameCity(id: idCity)
        
        // register TableView Cell
        self.tbl.register(TourCell.nib, forCellReuseIdentifier: TourCell.identifier)
        
        
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
        return tours.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

//        let reuseCell = "TourTableViewCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: TourCell.identifier, for: indexPath) as? TourCell {
            let tour = tours[indexPath.row]
            cell.lblTourTitle.text = tour.tourTitle
            cell.imgTour.image = tour.tourImage
            cell.tourRatingControl.setRatingValue(tour.ratingValue)
            return cell
            
        } else {
            fatalError("Can not create the cell")
        }
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
            case "tour":
                print("Chuyen man hinh tour1")
                navigationType = .tour
                if let destiantionController = segue.destination as? SearchViewController {
                    destiantionController.navigationType = .tour
                    destiantionController.tourTemplate = tours
                }
                
            default:
                break
            }
        }
    }
}
