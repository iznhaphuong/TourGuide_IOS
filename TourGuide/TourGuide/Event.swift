//
//  Event.swift
//  TourGuide
//
//  Created by Linh Trang on 26/05/2022.
//

import UIKit
class Event{
    //MARK: Properties
    var date = Date();
     var placeName:String;
    var time = Date();
    var noteEvent:String?;
    //MARK:Constructors
    init?( date:Date,
     placeName:String,
    time:Date,
    noteEvent:String) {
     
        self.date = date;
        self.placeName = placeName;
        self.time = time;
        if noteEvent.isEmpty{
            return nil;
        }
        self.noteEvent = noteEvent;
    }
    
}
