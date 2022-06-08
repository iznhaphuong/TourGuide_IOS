//
//  ViewController.swift
//  TourGuide
//
//  Created by Nhã Phương on 5/22/22.
//

import UIKit

class ScheduleController: UIViewController,UITableViewDelegate, UITableViewDataSource {
  

    @IBOutlet weak var lblMonth: UILabel!
    
    @IBOutlet weak var sideMenuBtn: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var date = Date()
    
    //tao navigation type de biet di duong nao hj
    enum NavigationType{
        case addEvent
        case editEvent
    }
    //gan dai 1 gia tri khong tao constructor
    var navigationType:NavigationType = .addEvent;
   
    var event:Event?
    var events = [Event]();
        override func viewDidLoad() {
            super.viewDidLoad()
            
            //
            sideMenuBtn.target = revealViewController()
            sideMenuBtn.action = #selector(revealViewController()?.revealSideMenu)
            
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .blue
            navigationController?.navigationBar.barStyle = .black
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

            navigationController?.navigationBar.tintColor = UIColor(#colorLiteral(red:12, green:122, blue:255, alpha:1.0))
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.compactAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance


            // set a background color so we can easily see the table

            var date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            let month = dateFormatter.string(from: self.date)
            let splitMonth = month.components(separatedBy:["/"," "])               
            // create time format
            dateFormatter.dateFormat =  "HH:mm"
            // time data
            let timeChange = dateFormatter.date(from: "17:00")!
            print("ay \(timeChange)")           
            //Create the event list for testing
            if let event = Event(date:date, placeName: "Ho Guom",time:timeChange, noteEvent: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "){
                events += [event]
            }
            //Add the edit menu button to navigation Bar
            navigationItem.rightBarButtonItem = editButtonItem
            
            // add the table view to self.view
            self.view.addSubview(tableView)

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
             
             let dateFormatter = DateFormatter()
             dateFormatter.dateStyle = .full
             dateFormatter.timeStyle = .short

            
            if let cell = tableView.dequeueReusableCell(withIdentifier: reuseCell, for: indexPath) as? ScheduleTableViewCell{
                
                let event = events[indexPath.row]
                
                let str = dateFormatter.string(from: event.date) // "Chủ Nhật, ngày 29 tháng 5, 2022"
                
                let splitDay = str.components(separatedBy:[" ","/"])
                //"9:29 CH Chủ Nhật, ngày 29 tháng 5, 2022"
                let splitDate = str.components(separatedBy:[" ","/"," "])
               //Time
                let timeChange = dateFormatter.string(from: event.time)
                let splitTime = timeChange.components(separatedBy:[" ",","])
                print("time \(splitTime[0])")
//                print("date \(splitDay[2]+splitDay[3])")
                cell.placeName.text = event.placeName
                cell.date.text = splitDate[5]
                cell.day.text = splitDay[2] + " " + splitDay[3]
                cell.time.text = splitTime[0]
                cell.noteEvent.text = event.noteEvent
            
                return cell
            }
            else{
                fatalError("Can not create the cell")
            }
        }

        // MARK: - Table view delegate

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // etc
        }
    // Override to support editing the table view.
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Delete the meal from data source
            events.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueIdentifier = segue.identifier {
            switch segueIdentifier {
            case "addEvent":
                //                print("New meal")
                navigationType = .addEvent
                //Get the destination controller (lay du lieu man hinh dich)
                if let destiController = segue.destination as? AddScheduleViewController {
                    //Get the selected meal (lay trong datasrc)
                    if let selectedIndexPath = tableView.indexPathForSelectedRow{ //Moi lan tap item se truy xuat lay ra duoc cai item do
                        destiController.event = events[selectedIndexPath.row]
                    }
                    //Mark the way to meal detail controller
//                    destiController.navigationType = .addEvent
                }
                
            case "editEvent":
                navigationType = .editEvent
                                print("Edit event")
                //Get the destination controller (lay du lieu man hinh dich)
                if let destiController = segue.destination as? AddScheduleViewController {
                    //Get the selected meal (lay trong datasrc)
                    if let selectedIndexPath = tableView.indexPathForSelectedRow{ //Moi lan tap item se truy xuat lay ra duoc cai item do
                        destiController.event = events[selectedIndexPath.row]
                    }
                    //Mark the way to meal detail controller
                    destiController.navigationType = .editEvent
                }
            default:
                break
            }
            
        }
    }
    
    //Definition of unWind
    @IBAction func unwindfromiAddScheduleViewController (segue: UIStoryboardSegue) {
        //Get src controller
        //
        if let sourceController = segue.source as? AddScheduleViewController{
            //Get the new event
            if let event = sourceController.event{
                switch navigationType{
                case .addEvent:
                    //Add the new event into data source
                    events += [event]
                    let newIndexPath = IndexPath(row:events.count - 1 , section:0)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                case .editEvent:
                    
                    //b1:
                    if let selectedIndexPath = tableView.indexPathForSelectedRow{
                        //update the edit event to datasource
                        events[selectedIndexPath.row] = event
                        //Reload row at selectedIndexPath
                        tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
                    }
                    
                }
                
                
            }
        }
        
        
    }

}

