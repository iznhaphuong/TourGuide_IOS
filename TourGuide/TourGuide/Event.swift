//
//  Event.swift
//  TourGuide
//
//  Created by Linh Trang on 26/05/2022.
//

import UIKit
class Event{
    //MARK: Properties
    var date:String;
     var day:String;
     var placeName:String;
    var time:String;
    var noteEvent:String;
    
    
    //MARK:Constructors
//    constructor co the tao duoc hoac khong tao duoc tu nhung bien truyen vao
    init?( date:String,
     day:String,
     placeName:String,
    time:String,
    noteEvent:String) {
        self.date = date;
        self.day = day;
        self.placeName = placeName;
        self.time = time;
        if noteEvent.isEmpty{
            return nil;
        }
        self.noteEvent = noteEvent;
    }
    
}
