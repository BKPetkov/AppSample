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
import ImagePicker
import Lightbox
import FirebaseStorage

class CameraViewController: UIViewController, UITextViewDelegate, ImagePickerDelegate {

    // MARK: Properties
    
    @IBOutlet weak var estaTextField: UITextView!
    
    @IBOutlet weak var testImgView: UIImageView!
    
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
    
    
    // MARK: Actions
    
    @IBAction func estaTxtBtnSubmit(_ sender: UIButton) {
        
        print("Send Message Btn Pressed")
        
        var ref: DatabaseReference!
        
        ref = Database.database().reference()
        
        ref.child("email").setValue(estaTextField.text)
        // creates new database node under the user's email
        // todo: should segue email constant from ViewController
        
        print(estaTextField.text)
        
        
    }
    
    
    
    @IBAction func pickPhoto(_ sender: Any) {
        
        let imagePickerController = ImagePickerController()
        imagePickerController.imageLimit = 1 //could increase
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)

        }
    
    
    @IBAction func sendPhoto(_ sender: UIButton) {
        
        // print("send photo btn pressed!")
        
        let string2 = "Test String Data"
        let localFile = string2.data(using: .utf8)
        
        
        // Uncomment line below to use actual image from gallery
        // Upload may take some time depending on the connection & image size
        
        //   let localFile:  NSData = UIImagePNGRepresentation(testImgView.image!)! as NSData
        
        
        // Create file metadata - not necessary
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        let storage2 = Storage.storage(url: "gs://iossample-9fd88.appspot.com")
        let photosRef = storage2.reference().child("images/myphoto4.jpg")
        

        let uploadTask = photosRef.putData(localFile as! Data, metadata: nil)
        
        // From AppleDev API: Listen for state changes, errors, and completion of the upload.
        uploadTask.observe(.resume) { snapshot in
            // Upload resumed, also fires when the upload starts
        }
        
        uploadTask.observe(.pause) { snapshot in
            // Upload paused
        }
        
        uploadTask.observe(.progress) { snapshot in
            // Upload reported progress
            let percentComplete = 100.0 * Double(snapshot.progress!.completedUnitCount)
                / Double(snapshot.progress!.totalUnitCount)
        }
        
        uploadTask.observe(.success) { snapshot in
            // Upload completed successfully
        }
        
        uploadTask.observe(.failure) { snapshot in
            if let error = snapshot.error as? NSError {
                switch (StorageErrorCode(rawValue: error.code)!) {
                case .objectNotFound:
                    // File doesn't exist
                    break
                case .unauthorized:
                    // User doesn't have permission to access file
                    break
                case .cancelled:
                    // User canceled the upload
                    break
                    
                    /* ... */
                    
                case .unknown:
                    // Unknown error occurred, inspect the server response
                    break
                default:
                    // A separate error occurred. This is a good place to retry the upload.
                    break
                }
            }
        }
        
    }
    
    
      // MARK: - ImagePickerDelegate
    
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        guard images.count > 0 else { return }
        
        let lightboxImages = images.map {
            return LightboxImage(image: $0)
        }
        
        let lightbox = LightboxController(images: lightboxImages, startIndex: 0)
        imagePicker.present(lightbox, animated: true, completion: nil)
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        imagePicker.dismiss(animated: true, completion: nil)
        print (images.count) // shouldn't be more than the limit above
        testImgView.image = nil
        testImgView.image = images[0]
        
        
    }
    
    
    
    
    

}
