//
//  AddScheduleViewController.swift
//  TourGuide
//
//  Created by Nhã Phương on 5/22/22.
//

import UIKit

class AddScheduleViewController: UIViewController {

    //MARK: Properties
    
    @IBOutlet weak var comment: UITextView!
    
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let borderGrayColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        
        setBorder(borderGrayColor)
        // Do any additional setup after loading the view.
    }
    
    func setBorder(_ borderGrayColor : UIColor) {
        comment.layer.borderWidth = 1
        comment.layer.borderColor = borderGrayColor.cgColor
        comment.layer.cornerRadius = 5.0
        
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

}
