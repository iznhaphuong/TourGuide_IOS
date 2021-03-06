//
//  ReviewViewController.swift
//  TourGuide
//
//  Created by Nhã Phương on 5/24/22.
//

import UIKit

class ReviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //datasource
    let desID = 1 //get from detail screen
    
    private var reviews : [Review]!
    //MARK: Properties
    @IBOutlet weak var reviewQty: UILabel!
    @IBOutlet weak var reviewTableView: UITableView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var reviewRating: RatingControl!
    @IBOutlet weak var reviewContent: UITextView!
    @IBOutlet weak var lblNotice: UILabel!
    
    override func viewDidLoad() {
        //Add dummy data to datasource
        reviews = Database.getReviews(desID: desID)
        
        // Side Menu
//        navigationController?.navigationBar.prefersLargeTitles = true
      
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .blue
        navigationController?.navigationBar.barStyle = .black
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.tintColor = UIColor(#colorLiteral(red:12, green:122, blue:255, alpha:1.0))
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        //Set review quantity
        reviewQty.text = "\(reviews.count) đánh giá"
        
        if Database.isReviewed(desID: desID, username: username.text!) {
            blockReview()
        }
        super.viewDidLoad()
        
        //Set border to review box
        let borderGrayColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        setBorder(borderGrayColor)
        //Set circle avt
        userAvatar.layer.cornerRadius = userAvatar.frame.height / 2
        //Set delegate and datasource
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
    }
    //Processing
    @IBAction func reviewBtnProcessing(_ sender: UIButton) {
        // get the current date and time
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        let time = formatter.string(from: currentDateTime)
        
        let myReview = Review(desID: self.desID, username: username.text!, avatar: userAvatar.image, reviewContent: reviewContent.text, ratingValue: reviewRating.getRatingValue(), reviewTime: time)
        
        if let myReview = myReview {
            Database.addReview(myReview: myReview)
            reviews = Database.getReviews(desID: desID)
            //            reviews.append(myReview)
            //Add the new review in table view (at index: 0)
            let newIndexPath = IndexPath(row: 0, section: 0)
            reviewTableView.insertRows(at: [newIndexPath], with: .automatic)
            blockReview()
            //Reset review quantity
            reviewQty.text = "\(reviews.count) đánh giá"
        }
    }
    @IBOutlet weak var reviewBtn: UIButton!
    func blockReview() {
        reviewRating.isHidden = true
        reviewContent.isHidden = true
        reviewBtn.isHidden = true
        lblNotice.text = "Bạn đã đánh giá địa điểm này trước đó."
    }
    
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseCell = "ReviewTableViewCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseCell, for: indexPath) as? ReviewTableViewCell {
            let review = reviews[indexPath.row]
            
            cell.avatar_item.image = review.avatar
            cell.usename_item.text = review.username
            cell.reviewContent_item.text = review.reviewContent
            cell.reviewDate_item.text = review.reviewTime
            cell.reviewRating_item.setRatingValue(review.ratingValue)
            return cell
        }
        fatalError("Cannot create cell")
    }
    
    
    func setBorder(_ borderGrayColor : UIColor) {
        reviewContent.layer.borderWidth = 1
        reviewContent.layer.borderColor = borderGrayColor.cgColor
        reviewContent.layer.cornerRadius = 5.0
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.revealViewController()?.gestureEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.revealViewController()?.gestureEnabled = true
    }
}
