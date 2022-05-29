//
//  testTableViewController.swift
//  TourGuide
//
//  Created by Khanh on 26/05/2022.
//

import UIKit

class testTableViewController: UITableViewController {
//    @IBOutlet weak var tbl: UITableView!
    @IBOutlet var tbl: UITableView!
    
    var homes = [Home]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeImage = UIImage(named: "default")
        if let home = Home(homeImage: homeImage, homeTitle: "Da Lat") {
            homes += [home]
        }
        
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
//        let reuseCell = "HomeCell1"
        // ham tai su dung giong recycerview
        if let cell = tableView.dequeueReusableCell(withIdentifier: HomeCell.identifier, for: indexPath) as? HomeCell {
            let home = homes[indexPath.row]
//            cell.imgLogo.image = home.homeImage
//            cell.lblTitle.text = home.homeTitle
            cell.configure(with: home)
            return cell
        }else{
            //         Configure the cell...
            fatalError("Can not created the cell") // Thong bao loi nghiem trong
        }
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

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
