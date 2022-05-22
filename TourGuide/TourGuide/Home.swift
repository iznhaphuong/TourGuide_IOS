//
//  Home.swift
//  TourGuide
//
//  Created by Khanh on 22/05/2022.
//

import Foundation
import UIKit

class Home {
    //MARK: Properties
    var homeImage:UIImage?
    var homeTitle:String
    
    //MARK: Constructors
    init?(homeImage:UIImage?, homeTitle:String) {
        if homeTitle.isEmpty {
            return nil
        }
        
        self.homeTitle = homeTitle
        self.homeImage = homeImage
    }
}
