//
//  DetailViewController.swift
//  TourGuide
//
//  Created by Tam on 29/05/2022.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailAddress: UILabel!
    @IBOutlet weak var detailContent: UILabel!
    @IBOutlet weak var btnDetailPlus: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var featurs = ["img-1", "img-2", "img-3", "img-4", "img-5", "img-6", "img-7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        self.title = "Hồ Gươm"
        imgLogo.image = UIImage(named: "default")
        imgLogo.layer.cornerRadius = imgLogo.frame.height / 2
        detailTitle.text = "Lăng Bác và Quảng trường Ba Đình"
        detailAddress.text = "2 Hùng Vương, Điện Bàn, Ba Đình, Hà Nội"
        detailContent.text = "Quảng trường Ba Đình là quảng trường lớn nhất Việt Nam, nằm trên đường Hùng Vương, quận Bà Đình và là nơi Lăng Chủ tịch Hồ Chí Minh được xây dựng"
        btnDetailPlus.layer.cornerRadius = btnDetailPlus.frame.height / 2
        
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // register TableView Cell
        self.collectionView.register(DetailCell.nib, forCellWithReuseIdentifier: DetailCell.identifier)
        
        //1
        let screenWidth = UIScreen.main.bounds.width - 10
        //2
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3.5, height: screenWidth/3.5)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        //3
        collectionView!.collectionViewLayout = layout
        
        
        // Update TableView with the data
        self.collectionView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featurs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCell.identifier, for: indexPath) as? DetailCell {
            let img = featurs[indexPath.row]
            cell.imgDetail.image = UIImage(named: img)
            print(img)
            
            return cell
        } else {
            fatalError("Can not create the cell")
        }
    }

}
