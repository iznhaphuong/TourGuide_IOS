//
//  ReviewTableViewCell.swift
//  TourGuide
//
//  Created by Nhã Phương on 5/24/22.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatar_item: UIImageView!
    
    @IBOutlet weak var reviewContent_item: UITextView!
    @IBOutlet weak var reviewRating_item: RatingControl!
    @IBOutlet weak var reviewDate_item: UILabel!
    @IBOutlet weak var usename_item: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // corner radius for avatar - circle image
        avatar_item.layer.cornerRadius = avatar_item.frame.height / 2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
