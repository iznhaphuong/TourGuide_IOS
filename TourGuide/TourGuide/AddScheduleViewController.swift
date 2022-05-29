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
    
    @IBOutlet weak var pickerTime: UIDatePicker!
    @IBOutlet weak var cancelButton: UIButton!
    var event:Event?
    
    //tao navigation type de biet di duong nao hj
    enum NavigationType{
        case newEvent
        case editEvent
    }
    //gan dai 1 gia tri khong tao constructor
    var navigationType:NavigationType = .newEvent;
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let borderGrayColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        
        setBorder(borderGrayColor)
        // Do any additional setup after loading the view.
        //Get event to edit from ScheduleController
        if let event = event{

            print("Ngay dia diem: \(event.date)")
            print("Thu dia diem: \(event.day)")
            
            pickerDate.date = event.date
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
    
//    @IBAction func Cancel(_ sender: UIBarButtonItem) {
//        switch navigationType {
//        case .newMeal:
//            dismiss(animated: true, completion: nil)
//        case .editMeal:
//            //Get the navigation controller and pop the view from stack
//            if let navigationController = navigationController {
//        navigationController.popViewController(animated: true)
//            }
//
//        }
//
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Sender de nhan dang duong di
//        if let btnSender = sender as? UIBarButtonItem {
//            if btnSender === btnSave {
//                //                print("btnSave is taped")
//                //Create the new meal
//                //if a = b ?? c
//                let name = edtMealName.text ?? ""
//                let img = imgFood.image
//                let ratingValue = ratingControl.getRatingValue()
//                //Luu vao bien thanh phan
//                meal = Meal(foodName: name, imgFood: img, ratingValue: ratingValue)
//            }
//        }

    }
}
