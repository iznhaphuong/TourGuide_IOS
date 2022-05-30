//
//  TourTableViewController.swift
//  TourGuide
//
//  Created by Khanh on 22/05/2022.
//

import UIKit

class TourTableViewController: UITableViewController {
    //MARK: Properties
    var tourists = [Tour]()
    @IBOutlet weak var sideMenuBtn: UIBarButtonItem!
    @IBOutlet var tbl: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Side Menu
        navigationController?.navigationBar.tintColor = .black

        sideMenuBtn.target = revealViewController()
        sideMenuBtn.action = #selector(revealViewController()?.revealSideMenu)

        // Create
        let tourImage = UIImage(named: "default")
        let toutTitle = "Ha Noi Rat Dep"
        let ratingValue = 5
        if let tour = Tour(tourImage: tourImage, tourTitle: toutTitle, ratingValue: ratingValue) {
            tourists += [tour]
        }
        
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
        return tourists.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

//        let reuseCell = "TourTableViewCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: TourCell.identifier, for: indexPath) as? TourCell {
            let tour = tourists[indexPath.row]
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
