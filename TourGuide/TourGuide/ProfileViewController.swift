//
//  ProfileViewController.swift
//  TourGuide
//
//  Created by Khanh on 22/05/2022.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK: Properties
    @IBOutlet weak var sideMenuBtn: UIBarButtonItem!
    @IBOutlet weak var imgProfile: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Side Menu
        navigationController?.navigationBar.tintColor = .black

        sideMenuBtn.target = revealViewController()
        sideMenuBtn.action = #selector(revealViewController()?.revealSideMenu)

        // Do any additional setup after loading the view.
        imgProfile.layer.cornerRadius = imgProfile.frame.height / 2
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
