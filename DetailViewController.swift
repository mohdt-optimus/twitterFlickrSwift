//
//  DetailViewController.swift
//  twitterFlickr_swift
//
//  Created by optimusmac-12 on 08/08/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
   
    @IBOutlet var imageView: UIImageView!
    var imageElement : UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image=imageElement
    }
    @IBAction func saveButton(sender: AnyObject) {
        
        var saveImg : UIImage = imageView.image!
        UIImageWriteToSavedPhotosAlbum(saveImg, nil, nil, nil)
        var msgView = UIAlertView()
        msgView.title="Message"
        msgView.message="Photo Saved Successfully"
        msgView.addButtonWithTitle("OK")
        msgView.show()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
