//
//  AddScheduleViewController.swift
//  TourGuide
//
//  Created by Nhã Phương on 5/24/22.
//
import UIKit

class AddScheduleViewController: UIViewController {
    
    //MARK:Properties
    @IBOutlet weak var note: UITextView!
    
    @IBOutlet weak var pickerDate: UIDatePicker!
    
    @IBOutlet weak var lblPlaceName: UITextField!
    @IBOutlet weak var btnDone: UIButton!
    @IBOutlet weak var pickerTime: UIDatePicker!
    @IBOutlet weak var cancelButton: UIButton!
    var event:Event?
    
    enum NavigationType{
        case newEvent
        case editEvent
    }

    var navigationType:NavigationType = .newEvent;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .blue
        navigationController?.navigationBar.barStyle = .black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.tintColor = UIColor(#colorLiteral(red:12, green:122, blue:255, alpha:1.0))
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance

        
        // Do any additional setup after loading the view.
        //Get event to edit from ScheduleController
        if let event = event{
            
            lblPlaceName.text = event.placeName
            pickerDate!.date = event.date
            pickerTime.date = event.time
            note.text = event.noteEvent
            
        }
    }
    
    func setBorder(_ borderGrayColor : UIColor) {
        note.layer.borderWidth = 1
        note.layer.borderColor = borderGrayColor.cgColor
        note.layer.cornerRadius = 5.0
        
        cancelButton.layer.borderWidth = 1
        cancelButton.layer.borderColor = borderGrayColor.cgColor
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func Cancel(_ sender: UIButton) {
        print("btncancel")
        switch navigationType {
            
        case .newEvent:
            dismiss(animated: true, completion: nil)
        case .editEvent:
            //Get the navigation controller and pop the view from stack
            if let navigationController = navigationController {
                navigationController.popViewController(animated: true)
            }
            
        }
    }
    
    //    @IBAction func Cancel(_ sender: UIBarButtonItem) {
    //        print("btn cancel is tapped")
    //        switch navigationType {
    //
    //        case .newEvent:
    //            dismiss(animated: true, completion: nil)
    //        case .editEvent:
    //            //Get the navigation controller and pop the view from stack
    //            if let navigationController = navigationController {
    //        navigationController.popViewController(animated: true)
    //            }
    //
    //        }
    //
    //    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //        Sender de nhan dang duong di
        if let btnSender = sender as? UIButton {
            if btnSender === btnDone {
                print("btnDone is taped")
                //                Create the new meal
                //                if a = b ?? c
                                let date = pickerDate.date
                                let placeName = lblPlaceName.text!
                //                let day = event.day?
                                let time = pickerTime.date
                                let note = note.text ?? " "
                                //Luu vao bien thanh phan
                               event = Event(date: date, day:"", placeName: placeName, time:time, noteEvent: note)
            }
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.revealViewController()?.gestureEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.revealViewController()?.gestureEnabled = true
    }
}
