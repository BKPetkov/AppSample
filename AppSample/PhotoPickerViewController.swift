//
//  PhotoPickerViewController.swift
//  AppSample
//
//  Created by Brian on 5/18/17.
//  Copyright © 2017 Brian. All rights reserved.
//


import UIKit

// Add supporting functions here
// For instance, viewing a group of already uploaded photos

class PhotoPickerViewController: UIImagePickerController, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        print("Opened Photo Picker View Controller!")
        // Do any additional setup after loading the view.
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

}
