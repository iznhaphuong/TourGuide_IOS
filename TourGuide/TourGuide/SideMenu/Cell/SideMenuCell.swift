//
//  SideMenuCell.swift
//  TourGuide
//
//  Created by Khanh on 23/05/2022.
//

import UIKit

class SideMenuCell: UITableViewCell {
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Background
        self.backgroundColor = .clear
        
        // Icon
        self.iconImageView.tintColor = .systemBlue
        
        // Title
        self.titleLabel.textColor = .systemBlue
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
