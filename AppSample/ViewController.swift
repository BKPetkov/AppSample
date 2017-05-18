//
//  ViewController.swift
//  AppSample
//
//  Created by Brian on 5/18/17.
//  Copyright © 2017 Brian. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var userTextField: UITextField!
    
    @IBOutlet weak var passTextField: UITextField!

    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var registerBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTextField.delegate = self
        passTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        
//    }
    
    

    //MARK: Actions
    
    @IBAction func logIn(_ sender: UIButton) {
        
        let email = userTextField.text
        let passw = passTextField.text
        // Login using Firebase
        Auth.auth().signIn(withEmail: email!, password: passw!) { (user, error) in
            // ...
            print (error)
            if (error == nil){
                 self.topLabel.text =  "Hi " + self.userTextField.text!
            }
            else{
                self.topLabel.text = "Invalid Login"
            }
        }
        
        
     
        //
        
    }
    
    
    @IBAction func registerUsr(_ sender: UIButton) {
        
        
        // Create User in Firebase
        
        let email = userTextField.text
        let password = passTextField.text
        Auth.auth().createUser(withEmail: email!, password: password!) { (user, error) in
            // ...
            print (error)
            if (error == nil){
                self.topLabel.text = "You are now Registered!"
                
                // Switch to Camera View Controller
                

                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "cameraViewController")
                self.present(controller, animated: true, completion: nil)
            }
            else{
                self.topLabel.text = "Invalid Entry"
            }

            // Add switch statement to display error messages in app
            
        }
        
   
        
  
    }
    
}

