//
//  TwitterTableViewCell.swift
//  twitterFlickr_swift
//
//  Created by optimusmac-12 on 12/08/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

import UIKit

class TwitterTableViewCell: UITableViewCell {

    @IBOutlet weak var tweetData: UITextView!
    @IBOutlet weak var tweetImage: UIImageView!
    @IBOutlet weak var tweetTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
