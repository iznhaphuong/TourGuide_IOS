//
//  TimeLIneTableViewCell.swift
//  TourGuide
//
//  Created by Linh Trang on 23/05/2022.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {

    
    @IBOutlet weak var noteEvent: UITextView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
