//
//  MoodTableViewCell.swift
//  dailyMoodTracker
//
//  Created by LisaBebe11 on 4/27/18.
//  Copyright © 2018 LisaBebe11. All rights reserved.
//

import UIKit

class MoodTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
