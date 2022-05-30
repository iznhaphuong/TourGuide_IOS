//
//  SearchTableViewController.swift
//  TourGuide
//
//  Created by Khanh on 24/05/2022.
//

import UIKit


class SearchTableViewController: UITableViewController, UISearchBarDelegate {
//    @IBOutlet weak var searchBar: UISearchBar!
//    @IBOutlet var tbl: UITableView!
    @IBOutlet weak var tbl: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Declare Array Of Contain All Country Name.
    var countries = ["Hà Nội", "Thủ Đức", "Hồ Chí Minh", "Đà Lạt"]

    // Declare  Second Array For Save Search Result
    var searchdata: [String]! = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set both delegate method in ViewDidLoad.
        tbl.delegate = self
        tbl.dataSource = self
        
        searchBar.delegate = self
        
        // Assign Value To Array And Register Cell
        tbl.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tbl.tableFooterView = UIView()
        
        //Assign value second array SearchData
        searchdata = countries
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchdata.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        // Configure the cell...

        let cell = tbl.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = searchdata[indexPath.row]
        
        cell.imageView?.image = UIImage(named: "default")
        
//        cell.textLabel?.textAlignment = .center
        
        cell.layer.borderWidth = 1
        
        cell.layer.borderColor = UIColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)).cgColor
        
        return cell
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
    
    //MARK:- SEARCH BAR DELEGATE METHOD FUNCTION

    

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        
        searchdata = countries
        searchBar.endEditing(true)
        tbl.reloadData()
    }

    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchdata = searchText.isEmpty ? countries : countries.filter {
            (item: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        
        tbl.reloadData()
        
        
    }

}
