//
//  Tour.swift
//  TourGuide
//
//  Created by Khanh on 22/05/2022.
//

import Foundation
import UIKit
class Tour {
    //MARK: Properties
    var tourImage:UIImage?
    var tourTitle:String
    var ratingValue:Int
    
    //MARK: Constructors
    init?(tourImage:UIImage?, tourTitle:String, ratingValue:Int) {
        if tourTitle.isEmpty {
            return nil
        }
        if ratingValue < 0 || ratingValue > 5 {
            return nil
        }
        
        self.ratingValue = ratingValue
        self.tourTitle = tourTitle
        self.tourImage = tourImage
    }
}
