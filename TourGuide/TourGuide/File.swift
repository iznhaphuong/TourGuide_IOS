//
//  File.swift
//  TourGuide
//
//  Created by Nhã Phương on 5/22/22.
//

import Foundation
//
//  RatingControl.swift
//  FoodManagement
//
//  Created by Nhã Phương on 4/12/22.
//

import UIKit
//IB_Interface buiding tạo đối tượng trên mà design, cho phép xem trước kết quả
@IBDesignable class RatingControl: UIStackView {
    //MARK: Properties
    //IBInspectable thêm giá trị vào bảng inspectable : giá trị, đối tượng phải là kiểu tường minh và viết tính năng didSet để thay đổi dữ liệu hiệu ứng vào chuong trinh
    @IBInspectable private var ratingValue:Int = 3
    {
        didSet {
            updateRatingButtonState()
        }
    }
    private var buttonArray = [UIButton] ()
    @IBInspectable private var starCount:Int = 5 {
        //moi lan thay doi thuoc tinh, goi lai ham init()
        didSet {
            initRatingControl()
        }
    }
    @IBInspectable private var starSize:CGSize = CGSize(width: 44, height: 44) {
        didSet {
            initRatingControl()
        }
    }
    
    //MARK: Contructors -> create pull item || code
    override init(frame: CGRect) {
        super.init(frame: frame)
        initRatingControl()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        initRatingControl()
    }
    
    private var activeButtonConstraint = true;
    
    //MARK: Initialization of Rating Control
    private func initRatingControl() {
        //Clear old button
        for button in buttonArray {
            //remove from stackview: must be delete 2 constrain
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        //Clear button array
        buttonArray.removeAll()
        //Set up the new rating control
        for _ in 0..<starCount {
            //create button
            let btnRating = UIButton()
            //MARK: Load image xu li them khi class la IBDesignable
            let bundle = Bundle(for: type(of: self))
            let normalStar = UIImage(named: "normalStar", in: bundle, compatibleWith: self.traitCollection)
            let pressedStar = UIImage(named: "pressedStar", in: bundle, compatibleWith: self.traitCollection)
            let selectedStar = UIImage(named: "selectedStar", in: bundle, compatibleWith: self.traitCollection)
            
            btnRating.setImage(normalStar, for: .normal)
            btnRating.setImage(pressedStar, for: .highlighted)
            btnRating.setImage(selectedStar, for: .selected)
            
            btnRating.widthAnchor.constraint(equalToConstant: starSize.width).isActive = activeButtonConstraint
            btnRating.heightAnchor.constraint(equalToConstant: starSize.height).isActive = activeButtonConstraint
            //event processing
            //buoc 1: tao ham de bat su kien
            //buoc 2: set func to event of button(noi thuc hien, hanh dong, su kien)
            btnRating.addTarget(self, action: #selector(ratingButtonPressed(_:)), for: .touchUpInside)
            
            //add new button to the stackview
            addArrangedSubview(btnRating)
            
            //add to the buttonArray
            //buttonArray += btnRating
            buttonArray.append(btnRating)
        }
        updateRatingButtonState()

    }
    
    
    //buoc 1: rating button processing
    @objc private func ratingButtonPressed(_ button: UIButton) {
        
        
        if let index = buttonArray.firstIndex(of: button) {
            if ratingValue ==  index + 1 {
                ratingValue-=1
            }else{
                ratingValue = index + 1
            }
            //update the state of rating button
            updateRatingButtonState()
        }
//        print(ratingValue)
    }
    
    private func updateRatingButtonState(){
        for (index, button) in buttonArray.enumerated() {
//            print ("index\(index) rate \(ratingValue)")
            button.isSelected = index < ratingValue
            
        }
    }
    //MARK: getter setter
    func setRatingValue(_ ratingValue:Int) {
        self.ratingValue = ratingValue
    }
    func getRatingValue() -> Int {
        return ratingValue
    }
}
