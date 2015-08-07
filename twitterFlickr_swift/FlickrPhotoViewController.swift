//
//  FlickrPhotoViewController.swift
//  twitterFlickr_swift
//
//  Created by optimusmac-12 on 05/08/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class FlickrPhotoViewController: UICollectionViewController {

  //  private let reuseIdentifier = "FlickrCell"
  //  private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

        // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
private var searches = [FlickrSearchResults]()
private let flickr = Flickr()

extension FlickrPhotoViewController : UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {    //Will be called when user press enter in text field
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .White)
       collectionView!.addSubview(activityIndicator)            //adding activity indicator on collection view
       activityIndicator.frame = collectionView!.bounds
       activityIndicator.startAnimating()               //starting animation of activity indicator
        flickr.searchFlickrForTerm(textField.text) {
            results, error in
            activityIndicator.removeFromSuperview()        //When search is done then removing the activity indicator
            if error != nil {
                println("Error searching : \(error)")
            }
            if results != nil {                         //Printing the count of number of images found
                println("Found \(results!.searchResults.count) matching \(results!.searchTerm)")

            }
        }
        return true
    }
}
