//
//  Review.swift
//  TourGuide
//
//  Created by Nhã Phương on 5/23/22.
//

import UIKit

class Review {
    var desID: Int
    var avatar:UIImage
    var username: String
    var reviewContent:String
    var reviewTime: String
    var ratingValue:Int
    
    //MARK: Constructor
    init? (desID: Int, username:String, avatar: UIImage?, reviewContent: String, ratingValue:Int, reviewTime: String) {
        self.desID = desID
        if username.isEmpty {
            return nil
        }
        if ratingValue < 0 || ratingValue > 5{
            return nil
        }
        self.username = username
        self.avatar = avatar!
        self.reviewContent = reviewContent
        self.reviewTime = reviewTime
        self.ratingValue = ratingValue
    }
}
