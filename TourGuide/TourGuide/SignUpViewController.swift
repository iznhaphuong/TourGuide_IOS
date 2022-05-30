//
//  SignUpViewController.swift
//  TourGuide
//
//  Created by MinhDuc on 26/05/2022.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var repassword: UITextField!
    
    
    @IBAction func signIn(_ sender: Any) {
        trasistionToLogin()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Side Menu
        
        self.navigationController!.navigationBar.barStyle = .black
//        self.navigationController!.navigationBar.isTranslucent = false
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        
        navigationController?.navigationBar.tintColor = .white

        
        // Do any additional setup after loading the view.
        logoImage.layer.cornerRadius = logoImage.frame.size.width/2
        
        password.isSecureTextEntry = true
        repassword.isSecureTextEntry = true
        
    }
            
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func validateFields() -> String? {
        // Check tha all fields are filled in
        if userName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || userEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            
        }
        
        //Check if the password is secure
        let cleanedPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if SignUpViewController.isPasswordValid(cleanedPassword){
            //Password is'nt  secure enough
            return "Please make sure your password is at least 8 characters, contrains a special character and a number. "
        }
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        //validation the fields
        let error = validateFields()
        
        if error != nil {
            //There's something wrong with the fields, show erro message
            print(error ?? "")
        }else {
            //Create cleaned versions of the data
            let name = userName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = userEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let repassword = repassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            if password == repassword {
                //Create user
                Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                    //Check for errors
                    if err != nil {
                        
                        //There was an error creating the user
                        print("Error creating user")
                    }
                    else{
                        //User was created successfully, now store the username
                        let db = Firestore.firestore()
                        
                        db.collection("users").addDocument(data: ["name": name, "uid": result!.user.uid ]) { (error) in
                            
                            if error != nil {
                                // Show error message
                                print("Error saving user data")
                            }
                        }
                        
                        //Transision to the login screen
                        self.trasistionToLogin()
                    }
                }
            }else{
                print("Password and Re-Password is difference")
            }
            
            
        }
        //Create the user
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    func trasistionToLogin()  {
        let signInViewController =  storyboard?.instantiateViewController(withIdentifier: "signIn") as? SignInViewController
        view.window?.rootViewController = signInViewController
        view.window?.makeKeyAndVisible()
    }

}
