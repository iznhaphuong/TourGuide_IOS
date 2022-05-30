//
//  SignInViewController.swift
//  TourGuide
//
//  Created by MinhDuc on 26/05/2022.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class SignInViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
   
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func signUp(_ sender: Any) {
        let signUpViewController =  storyboard?.instantiateViewController(withIdentifier: "signUp") as? SignUpViewController
        view.window?.rootViewController = signUpViewController
        view.window?.makeKeyAndVisible()
    }
    
    @IBAction func login(_ sender: Any) {
        //Validate Text Fields

        //Create cleaned versions of the text field
        let email = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                //Couldn't sign in
                print(error!.localizedDescription)
            }else{
                let homeViewController =  self.storyboard?.instantiateViewController(withIdentifier: "Home") as? MainViewController
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // nav
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .blue
        navigationController?.navigationBar.barStyle = .black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.tintColor = UIColor(#colorLiteral(red:12, green:122, blue:255, alpha:1.0))
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        logoImage.layer.cornerRadius = logoImage.frame.size.width/2
        // Do any additional setup after loading the view.
//        logoImage.layer.cornerRadius = logoImage.frame.size.width/2
        
        password.isSecureTextEntry = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.revealViewController()?.gestureEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.revealViewController()?.gestureEnabled = true
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
