//
//  LogInController.swift
//  HackerBuddy
//
//  Created by alden lamp on 11/27/16.
//  Copyright © 2016 alden lamp. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LogInController: UIViewController {

    @IBOutlet var backgroundImage: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var errorLabel: UILabel!
    
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    @IBOutlet var usernameView: UIView!
    @IBOutlet var passwordView: UIView!
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        readyView()
    }
    
    func readyView(){
        
        let backgroundInFillColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.10)
        //let borderColor = UIColor(red: 0.420, green: 0.376, blue: 0.788, alpha: 1.00)
        let lightRedColor = UIColor(red: 0.988, green: 0.384, blue: 0.463, alpha: 1.00)
        //let darkerRedColor = UIColor(red: 0.882, green: 0.188, blue: 0.310, alpha: 1.00)
        
        errorLabel.textColor = UIColor.white
        errorLabel.isHidden = true
        titleLabel.textColor = lightRedColor
        
        
        backgroundImage.layer.zPosition = -1
        
        usernameTextField.layer.cornerRadius = 25
        usernameView.layer.cornerRadius = 25
        passwordTextField.layer.cornerRadius = 25
        passwordView.layer.cornerRadius = 25
        
        usernameTextField.backgroundColor = backgroundInFillColor
        usernameView.backgroundColor = backgroundInFillColor
        passwordTextField.backgroundColor = backgroundInFillColor
        passwordView.backgroundColor = backgroundInFillColor
        
        passwordView.layer.borderColor = lightRedColor.cgColor//UIColor.white.cgColor
        passwordView.layer.borderWidth = 1.5
        usernameView.layer.borderColor = lightRedColor.cgColor//UIColor.white.cgColor
        usernameView.layer.borderWidth = 1.5
        
        usernameTextField.attributedPlaceholder = NSAttributedString(string:"Username", attributes:[NSForegroundColorAttributeName: UIColor.white])
        passwordTextField.attributedPlaceholder = NSAttributedString(string:"Password", attributes:[NSForegroundColorAttributeName: UIColor.white])
        
        usernameTextField.textColor = UIColor.white
        passwordTextField.textColor = UIColor.white
        
        usernameTextField.font = UIFont(name: "Avenir-Book", size: 24.0)
        usernameTextField.minimumFontSize = 15
        passwordTextField.font = UIFont(name: "Avenir-Book", size: 24.0)
        passwordTextField.minimumFontSize = 15
        
        passwordTextField.isSecureTextEntry = true
        
        logInButton.setTitle("Log In", for: .normal)
        logInButton.layer.cornerRadius = 25
        logInButton.setTitleColor(UIColor.white, for: .normal)
        logInButton.backgroundColor = lightRedColor
        
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.layer.cornerRadius = 25
        signUpButton.setTitleColor(UIColor.white, for: .normal)
        signUpButton.backgroundColor = lightRedColor
        
    }
    
    
    @IBAction func LogIn(_ sender: Any) {
        if usernameTextField.text != nil && passwordTextField.text != nil{
        FIRAuth.auth()?.signIn(withEmail: usernameTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            if error != nil{
                print(error)
            }else{
                print("signED IN")
                print(user)
            }
        })
        }
        
        
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        
        if(usernameTextField.text != nil && passwordTextField.text != nil){
            
            FIRAuth.auth()?.createUser(withEmail: usernameTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                if error != nil{
                    //"The email address is already in use by another account."
                    //"The password must be 6 characters long or more."
                    //"The email address is badly formatted."
                    
                    print("\n\nERROR: \(error?.localizedDescription)]\n\n")
                    
                    
                }else{
                    self.LogIn(1)
                }
                
            })
            
        }
        
        
    }
    
    

}
