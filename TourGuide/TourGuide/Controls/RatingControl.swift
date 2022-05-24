//
//  RatingControl.swift
//  TourGuide
//
//  Created by Khanh on 22/05/2022.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    @IBInspectable var startSize:CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            InitRatingControl()
        }
    }
    @IBInspectable var startCount:Int = 5 {
        didSet {
            InitRatingControl()
        }
    }
    var activeButtonContraint = true
    
    
    //MARK: properties
    @IBInspectable private var ratingValue:Int = 0 {
        didSet {
            updateRatingButtonState()
        }
    }
    private var ratingButtons = [UIButton]()
    //MARK: constructors
    override init(frame: CGRect) {
        super.init(frame: frame)
        InitRatingControl()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        InitRatingControl()
    }
    
    //MARK: initialization of rating control
    private func InitRatingControl() {
        // clear the old button
        for button in ratingButtons {
            // Remove from StackView
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        // Clear the button array
        ratingButtons.removeAll()
        
        // SetUp the new raiting controll
        for _ in 0..<startCount {
            //Create rating button
            let btnRating = UIButton()
            
//            btnRating.backgroundColor = UIColor.red
            
            // Load stars to the rating butttons
            let bundle = Bundle(for: type(of: self))
            let normalStar = UIImage(named: "nomalStar", in: bundle, compatibleWith: self.traitCollection)
            let selectedStar = UIImage(named: "selectedStar", in: bundle, compatibleWith: self.traitCollection)
            let pressedStar = UIImage(named: "pressedStar", in: bundle, compatibleWith: self.traitCollection)
            
            btnRating.setImage(normalStar, for: .normal)
            btnRating.setImage(selectedStar, for: .selected)
            btnRating.setImage(pressedStar, for: .highlighted)
            
            btnRating.heightAnchor.constraint(equalToConstant: startSize.height).isActive = activeButtonContraint
            btnRating.widthAnchor.constraint(equalToConstant: startSize.width).isActive = activeButtonContraint
            
            //Event processing
            btnRating.addTarget(self, action: #selector(ratingButtonPressed(button:)), for: .touchUpInside)
            //Add the new button to the StackView
            addArrangedSubview(btnRating)
            //add to the array of buttons
            //ratinhButtons += [btnRating] //cach 1
            ratingButtons.append(btnRating) //cach 2
            
            updateRatingButtonState()
        }
        
    }
    //MARK: Rating button event processing
    @objc private func ratingButtonPressed(button: UIButton) {
//        print("Calles")
        if let index = ratingButtons.firstIndex(of: button) {
            // Update the ratingValue
            if index + 1 == ratingValue {
                ratingValue -= 1
            } else {
                ratingValue = index + 1
            }
            // Update the state of rating
            updateRatingButtonState()
        }
//        print("Chi so cua button la: \(index!)")
    }
    func updateRatingButtonState() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < ratingValue
        }
    }
    //MARK: Getter and setter
    func setRatingValue(_ ratingValue:Int) {
        self.ratingValue = ratingValue
    }
    func getRatingValue() -> Int {
        return ratingValue
    }

}
