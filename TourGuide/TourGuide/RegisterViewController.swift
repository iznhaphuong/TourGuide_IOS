//
//  ViewController.swift
//  TourGuide
//
//  Created by Nhã Phương on 5/22/22.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var imgLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgLogo.layer.cornerRadius = imgLogo.frame.height / 2
    }


}

