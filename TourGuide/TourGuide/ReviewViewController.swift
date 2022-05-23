//
//  ReviewViewController.swift
//  TourGuide
//
//  Created by Nhã Phương on 5/22/22.
//

import UIKit

class ReviewViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var review: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let borderGrayColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        
        setBorder(borderGrayColor)
      
        userAvatar.layer.cornerRadius = userAvatar.frame.height / 2
        // Do any additional setup after loading the view.
    }
    
    func setBorder(_ borderGrayColor : UIColor) {
        review.layer.borderWidth = 1
        review.layer.borderColor = borderGrayColor.cgColor
        review.layer.cornerRadius = 5.0
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
