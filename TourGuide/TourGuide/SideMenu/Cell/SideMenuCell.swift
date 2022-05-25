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
    
    @IBOutlet var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Background
        self.backgroundColor = .clear
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        if selected {
            // Title
            self.titleLabel.textColor = UIColor(#colorLiteral(red:0.3, green:0.68, blue:0.97, alpha:1.0))
        } else {
            // Title
            self.titleLabel.textColor = .black
        }
        
    }

}
