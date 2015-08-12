//
//  TwitterViewController.swift
//  twitterFlickr_swift
//
//  Created by optimusmac-12 on 12/08/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

import UIKit
import Social
import Accounts

class TwitterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
    @IBOutlet weak var tweetTable: UITableView!
    var tweetArray = [AnyObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showTweet()
//        tweetTable.estimatedRowHeight = 200
//        tweetTable.rowHeight = UITableViewAutomaticDimension
//        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        activityIndicator.removeFromSuperview()
        let cell = self.tweetTable.dequeueReusableCellWithIdentifier("Cell")
            as! TwitterTableViewCell
        
        let row = indexPath.row
        
        let tweet = self.tweetArray[row] as! NSDictionary
        let userinfo = tweet.objectForKey("user") as! NSDictionary
        
        cell.tweetData!.text = tweet.objectForKey("text") as? String
        cell.tweetTitle!.text = userinfo.objectForKey("name") as? String
        var imageInfo : NSString = (userinfo.objectForKey("profile_image_url") as? String)!
        let url = NSURL(string: imageInfo as String)
        let data = NSData(contentsOfURL: url!) 
        cell.tweetImage.image = UIImage(data: data!)
        return cell
    }
    func showTweet(){
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        var screenWidth = screenSize.width
        var screenHeight = screenSize.height
        tweetTable!.addSubview(activityIndicator)            //adding activity indicator on collection view
        activityIndicator.frame = tweetTable!.bounds
        activityIndicator.center.x = screenWidth/2
        activityIndicator.center.y = screenHeight/2
          activityIndicator.startAnimating()
        let account = ACAccountStore()
        let accountType = account.accountTypeWithAccountTypeIdentifier(
            ACAccountTypeIdentifierTwitter)
        
        account.requestAccessToAccountsWithType(accountType, options: nil,
            completion: {(success: Bool, error: NSError!) -> Void in
                
                if success {
                let arrayOfAccounts = account.accountsWithAccountType(accountType)
                
                    if arrayOfAccounts.count > 0 {
                        let twitterAccount = arrayOfAccounts.last as! ACAccount
                        let requestURL = NSURL(string:
                            "https://api.twitter.com/1.1/statuses/user_timeline.json")
                        
                        let parameters = ["include_entities":"1","count" : "40"]
                        
                        let postRequest = SLRequest(forServiceType:
                            SLServiceTypeTwitter,
                            requestMethod: SLRequestMethod.GET,
                            URL: requestURL,
                            parameters: parameters)
                        
                        postRequest.account = twitterAccount
                        
                        postRequest.performRequestWithHandler(
                            {(responseData: NSData!,
                                urlResponse: NSHTTPURLResponse!,
                                error: NSError!) -> Void in
                                var err: NSError?
                                self.tweetArray = NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.MutableLeaves, error: &err) as! [AnyObject]
                                
                                if self.tweetArray.count != 0 {
                                    dispatch_async(dispatch_get_main_queue()) {
                                        self.tweetTable.reloadData()
                                    }
                                }
                        })
                    }
                } else {
                    println("Failed to access account")
                }
                
            })
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
