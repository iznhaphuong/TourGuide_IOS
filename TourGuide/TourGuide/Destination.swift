//
//  Destination.swift
//  TourGuide
//
//  Created by Khanh on 30/05/2022.
//

import Foundation
import UIKit
class Destination {
    var id:Int
    var city_id:Int
    var name:String
    var img:UIImage?
    var position:Position
    var description:String
    var ratingValue:Int
    
    init(id:Int,city_id:Int, name:String, img:UIImage?,position:Position,  description:String, ratingValue:Int) {
        self.id = id
        self.city_id = city_id
        self.name = name
        self.img = img
        self.position = position
        self.description = description
        self.ratingValue = ratingValue
    }
}
