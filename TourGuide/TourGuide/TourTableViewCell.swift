//
//  TourTableViewCell.swift
//  TourGuide
//
//  Created by Khanh on 22/05/2022.
//

import UIKit

class TourTableViewCell: UITableViewCell {

    @IBOutlet weak var imgTour: UIImageView!
    @IBOutlet weak var lblTourTitle: UILabel!
    @IBOutlet weak var tourRatingControl: RatingControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
