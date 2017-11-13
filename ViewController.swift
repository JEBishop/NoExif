//
//  ViewController.swift
//  NoExif
//
//  Created by Josh Bishop on 2017-11-13.
//  Copyright © 2017 Josh Bishop. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openPhotoLibraryButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }

}

