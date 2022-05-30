//
//  DetailCell.swift
//  TourGuide
//
//  Created by Tam on 29/05/2022.
//

import UIKit

class DetailCell: UICollectionViewCell {
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil) }
    @IBOutlet weak var imgDetail: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
