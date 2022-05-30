//
//  HomeCell.swift
//  TourGuide
//
//  Created by Khanh on 25/05/2022.
//

import UIKit

class HomeCell: UITableViewCell {
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Background
        self.backgroundColor = .clear
        
        // img
        self.imgLogo.layer.cornerRadius = self.imgLogo.frame.height / 2
        
        // Title
        self.lblTitle.textColor = .black
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
