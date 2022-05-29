//
//  Database.swift
//  TourGuide
//
//  Created by Khanh on 30/05/2022.
//

import Foundation
import UIKit

final class Database {
    static var cities = [
        City(id: 1, name: "Hà Nội", logo: "default"),
        City(id: 2, name: "Đà Lạt", logo: "default"),
//        City(id: 3, name: "Thủ Đức", logo: "default")
    ]
    
    static var destinations = [
        Destination(id: 1, city_id: 1, name: "Quảng trường Ba Đình", img: UIImage(named: "default"),
                    position: Position(latitude: 10.8, longitude: 106.7),
                    description: "Quảng trường Ba Đình là địa điểm du lịch ở Hà Nội mà các bạn không thể bỏ qua. Nơi đây là trung tâm chính trị của Việt Nam với nhà Quốc hội, Phủ Chủ tịch, Bảo tàng Hồ Chí Minh,…",
                    listImg: [
                        UIImage(named: "img-1")!,
                        UIImage(named: "img-2")!,
                        UIImage(named: "img-4")!,
                        UIImage(named: "img-6")!,
                    ],
                    ratingValue: 5),
        Destination(id: 2, city_id: 1, name: "Hồ Gươm", img: UIImage(named: "default"),
                    position: Position(latitude: 10.8, longitude: 106.7),
                    description: "Hồ Gươm hay hồ Hoàn Kiếm là một trong những nơi nên đến ở Hà Nội khi du lịch thủ đô. Nằm ở giữa trung tâm, Hồ Gươm được ví như trái tim của thành phố ngàn năm tuổi này",
                    listImg: [
                        UIImage(named: "img-1")!,
                        UIImage(named: "img-2")!,
                        UIImage(named: "img-4")!,
                        UIImage(named: "img-6")!,
                        UIImage(named: "img-3")!,
                        UIImage(named: "img-5")!,
                        UIImage(named: "img-7")!,
                    ],
                    ratingValue: 4),
        Destination(id: 3, city_id: 2, name: "Thác Datanla", img: UIImage(named: "default"),
                    position: Position(latitude: 10.8, longitude: 106.7),
                    description: "Thác Datanla nằm giữa đèo Prenn, có độ cao hơn 20m, lại nằm ở thượng nguồn của dòng chảy nên dòng nước lúc nào cũng chảy ổn định và êm đềm. ",
                    listImg: [
                        UIImage(named: "img-1")!,
                        UIImage(named: "img-4")!,
                        UIImage(named: "img-6")!,
                    ],
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
}
