//
//  PhotoViewController.swift
//  NoExif
//
//  Created by J Bishop on 2017-11-13.
//  Copyright © 2017 Josh Bishop. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var capturedImage: UIImageView!
    var newImage: UIImage!
    var imageData: CFData!
    var exifDict: NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        capturedImage.image = newImage
        
        imageData = UIImageJPEGRepresentation(newImage, 1.0)! as CFData
        let imageSource = CGImageSourceCreateWithData(imageData, nil)
        let exifDict = CGImageSourceCopyPropertiesAtIndex(imageSource!, 0, nil) as NSDictionary?
        if let gpsData = exifDict?[kCGImagePropertyGPSDictionary as String] {
            print(gpsData)
        }
        print(exifDict!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exifDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Fix this
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        tableCell.textLabel?.text = "Test {indexPath.row}"
        return tableCell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
