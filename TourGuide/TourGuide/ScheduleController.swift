//
//  ViewController.swift
//  TourGuide
//
//  Created by Nhã Phương on 5/22/22.
//

import UIKit

class ScheduleController: UIViewController,UITableViewDelegate, UITableViewDataSource {
//    let tableView : UITableView = {
//            let t = UITableView()
//            t.translatesAutoresizingMaskIntoConstraints = false
//            return t
//        }()
    
    
    @IBOutlet weak var tableView: UITableView!
    
   
    
    var events = [Event]();
        override func viewDidLoad() {
            super.viewDidLoad()

           print("hello")
            
            // set a background color so we can easily see the table

            //Create the food list for testing

            if let event = Event(date: "25", day:"Thu 5", placeName: "Ho Guom", time: "8:30", noteEvent: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."){
                events += [event]
            }
            //Add the edit menu button to navigation Bar
            navigationItem.leftBarButtonItem = editButtonItem
            // add the table view to self.view
            self.view.addSubview(tableView)

            // constrain the table view to 120-pts on the top,
            //  32-pts on left, right and bottom (just to demonstrate size/position)

            

            // set delegate and datasource
            tableView.delegate = self
            tableView.dataSource = self

            // register a defalut cell
            tableView.register(UINib(nibName: "ScheduleTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        }

        // Note: because this is NOT a subclassed UITableViewController,
        // DataSource and Delegate functions are NOT overridden

        // MARK: - Table view data source

        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return events.count
        }

         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //dequeueReusableCell: reuse func
            let reuseCell = "scheduleTableViewCell";
            //goi thong qua cha nen phai ep kiu ve con
            if let cell = tableView.dequeueReusableCell(withIdentifier: reuseCell, for: indexPath) as? ScheduleTableViewCell{
                let event = events[indexPath.row]
                cell.placeName.text = event.placeName
                cell.date.text = event.date
                cell.day.text = event.day
                cell.time.text = event.time
                cell.noteEvent.text = event.noteEvent
            
                return cell
            }
            else{
                fatalError("Can not create the cell")
            }
        }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
    }
        // MARK: - Table view delegate

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // etc
        }
        

}

