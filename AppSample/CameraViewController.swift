//
//  CameraViewController.swift
//  AppSample
//
//  Created by Brian on 5/18/17.
//  Copyright © 2017 Brian. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseAnalytics
import FirebaseDatabase

class CameraViewController: UIViewController, UITextViewDelegate {

    // MARK: Properties
    
    @IBOutlet weak var estaTextField: UITextView!
    
    @IBOutlet weak var estaTextBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        estaTextField.delegate = self
    
        print("debug: CameraViewController is now active")
        

    }
    
    
    //MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    //MARK: UITextViewDelegate
    
    
    func textViewShouldReturn(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
            estaTextField.text = ""
            estaTextField.textColor = UIColor.black
            print("debugging statement")
        
    }
    

    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK: Actions
    
    @IBAction func estaTxtBtnSubmit(_ sender: UIButton) {
        
        print("Send Message Btn Pressed")
        
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        ref.child("email").setValue(estaTextField.text)
        // creates new database node under the user's email
        // todo: should segue email constant from ViewController
        
        print(estaTextField.text)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "PhotoPickerViewController")
        self.present(controller, animated: true, completion: nil)
        
        
        
    }
    
    
    
    

}
