//
//  Database.swift
//  TourGuide
//
//  Created by Khanh on 30/05/2022.
//

import Foundation
import UIKit

final class Database {
    
    static var reviews = [
        Review(desID: 1, username: "adm", avatar:  UIImage(named: "default"), reviewContent: "nhàm chán", ratingValue: 1, reviewTime: "26-06-2021"),
        Review(desID: 1, username: "carrot.was.bobbing", avatar:  UIImage(named: "default"), reviewContent: "xink dep tuyet voi", ratingValue: 5, reviewTime: "30-5-2022"),
        Review(desID: 2, username: "carrot.was.bobbing", avatar:  UIImage(named: "default"), reviewContent: "không khí tốt", ratingValue: 4, reviewTime: "30-5-2022"),
        Review(desID: 1, username: "i.am.bot", avatar:  UIImage(named: "default"), reviewContent: "món ăn ở đây ngon tuyệt", ratingValue: 4, reviewTime: "31-5-2022")
    ]
    
    static var cities = [
        City(id: 1, name: "Hà Nội", logo: "default"),
        City(id: 2, name: "Đà Lạt", logo: "default"),
//        City(id: 3, name: "Thủ Đức", logo: "default")
    ]
    
    static var destinations = [
        Destination(id: 1, city_id: 1, name: "Quảng trường Ba Đình", img: UIImage(named: "default"),
                    position: Position(latitude: 10.8, longitude: 106.7),
                    description: "Quảng trường Ba Đình là địa điểm du lịch ở Hà Nội mà các bạn không thể bỏ qua. Nơi đây là trung tâm chính trị của Việt Nam với nhà Quốc hội, Phủ Chủ tịch, Bảo tàng Hồ Chí Minh,…",
                    ratingValue: 5),
        Destination(id: 2, city_id: 1, name: "Hồ Gươm", img: UIImage(named: "default"),
                    position: Position(latitude: 10.8, longitude: 106.7),
                    description: "Hồ Gươm hay hồ Hoàn Kiếm là một trong những nơi nên đến ở Hà Nội khi du lịch thủ đô. Nằm ở giữa trung tâm, Hồ Gươm được ví như trái tim của thành phố ngàn năm tuổi này",
                    ratingValue: 4),
        Destination(id: 3, city_id: 2, name: "Thác Datanla", img: UIImage(named: "default"),
                    position: Position(latitude: 10.8, longitude: 106.7),
                    description: "Thác Datanla nằm giữa đèo Prenn, có độ cao hơn 20m, lại nằm ở thượng nguồn của dòng chảy nên dòng nước lúc nào cũng chảy ổn định và êm đềm. ",
                    ratingValue: 3)
    ]
    
    class func getTour(id:Int) -> [Tour] {
        var tours = [Tour]()
        for i in self.destinations {
            if i.city_id == id {
                tours.append(Tour(tourImage: i.img, tourTitle: i.name, ratingValue: i.ratingValue)!)
            }
        }
        return tours
    }
    
    class func getNameCity(id:Int) -> String {
        for i in self.cities {
            if i.id == id {
                return i.name
            }
        }
        return ""
    }
    
    class func addCity(nameCity:String, logo:String) {
        self.cities.append(City(id: self.cities.count + 1, name: nameCity, logo: logo))
    }
    
    //FOR REVIEW
    class func getReviews(desID:Int) -> [Review] {
        var rvs = [Review]()
        for i in self.reviews {
            if let rv = i {
                if rv.desID == desID {
                    let myreview = rv
                    rvs.insert(myreview, at: 0)

                }
            }
          
        }
        return rvs
    }
    
    class func isReviewed (desID:Int, username: String) -> Bool {
        for i in self.reviews {
            if let rv = i {
                if rv.desID == desID && rv.username == username{
                    return true
                }
            }
            
        }
        return false
    }
    
    class func addReview(myReview: Review) {
//        self.reviews.insert(myReview, at: 0)
        self.reviews.append(myReview)
    }
}
