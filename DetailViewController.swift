//
//  DetailViewController.swift
//  twitterFlickr_swift
//
//  Created by optimusmac-12 on 08/08/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBAction func saveButton(sender: AnyObject) {
    }
    var collect : FlickrPhoto
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image=collect.thumbnail;
        
        // Do any additional setup after loading the view.
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
