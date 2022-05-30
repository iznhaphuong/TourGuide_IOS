//
//  TourCell.swift
//  TourGuide
//
//  Created by Khanh on 25/05/2022.
//

import UIKit

class TourCell: UITableViewCell {
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    @IBOutlet weak var imgTour: UIImageView!
    @IBOutlet weak var lblTourTitle: UILabel!
    @IBOutlet weak var tourRatingControl: RatingControl!
    @IBOutlet weak var lblTourist: UILabel!
    @IBOutlet weak var lblTourAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
