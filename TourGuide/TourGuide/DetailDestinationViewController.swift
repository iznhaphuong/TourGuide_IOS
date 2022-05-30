//
//  DetailDestinationViewController.swift
//  TourGuide
//
//  Created by Linh Trang on 30/05/2022.
//

import UIKit

class DetailDestinationViewController: UIViewController   {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!

   

    
    
    @IBOutlet weak var btnReview: UIButton!
    @IBOutlet weak var detailRating: RatingControl!
    @IBOutlet weak var detailDescription: UITextView!
    @IBOutlet weak var btnDetailPlus: UIButton!
   
    var destination:Destination?
    var position:Position?
    var event:Event?
    enum NavigationType {
        case addEvent
    }
    var navigationType:NavigationType = .addEvent;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .blue
        navigationController?.navigationBar.barStyle = .black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.tintColor = UIColor(#colorLiteral(red:12, green:122, blue:255, alpha:1.0))
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
            
        let placeName = "Lăng Bác và Quảng trường Ba Đình"
        let image = UIImage(named: "default")
        let position = Position(latitude: 10.8, longitude: 106.7)
        let description = "Quảng trường Ba Đình là quảng trường lớn nhất Việt Nam, nằm trên đường Hùng Vương, quận Bà Đình và là nơi Lăng Chủ tịch Hồ Chí Minh được xây dựng"
        imgLogo.layer.cornerRadius = imgLogo.frame.height / 2
        let destination = Destination(id: 1, city_id: 1, name: placeName, img: image, position: position, description: description, ratingValue: 3)
            
            
            detailTitle.text = destination.name
            destination.position = position
            
            detailDescription.text = destination.description
            detailRating.setRatingValue(destination.ratingValue)
        
        
        
        //Custom btn
        btnDetailPlus.layer.cornerRadius = btnDetailPlus.frame.height / 2
        
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
//        if let btnSender = sender as? UIButton {
//            if btnSender === btnReview
//            {
//                                print("btnReview is taped")
//            }
//        }
//        //Sender de nhan dang duong di
//
                let name = detailTitle.text
                let id = 1
                let cityId = destination?.city_id
                //Luu vao bien thanh phan
                destination = Destination(id: id ?? 0,city_id: cityId ?? 0,name: name ?? "",img: nil,position:position ?? Position(latitude: 0,longitude: 0.0), description: "",ratingValue: 0)
        navigationType = .addEvent
        
//        if let destiController = segue.destination as? AddScheduleViewController {
//            
//            if let destination = destination {
//                destiController.destination = destination
//                    
//            }
//            self.present(UINavigationController(rootViewController: destinationViewController), animated: true, completion: nil)
//
//            
//        destiController.navigationType = .addEvent
//        }
    }
    

}
