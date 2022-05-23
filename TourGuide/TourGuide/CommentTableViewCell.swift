//
//  CommentTableViewCell.swift
//  TourGuide
//
//  Created by Nhã Phương on 5/23/22.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    //MARK: Properties
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var reviewRatingControl: RatingControl!
    @IBOutlet weak var reviewTime: UILabel!
    @IBOutlet weak var reviewContent: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // corner radius for avatar - circle image
        avatar.layer.cornerRadius = avatar.frame.height / 2

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
