//
//  HomeTableViewCell.swift
//  TourGuide
//
//  Created by Khanh on 22/05/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var imgHome: UIImageView!
    @IBOutlet weak var lblHomeTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
