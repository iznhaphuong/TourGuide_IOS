//
//  SideMenuViewController.swift
//  TourGuide
//
//  Created by Khanh on 23/05/2022.
//

import UIKit

protocol SideMenuViewControllerDelegate {
    func selectedCell(_ row: Int)
}

class SideMenuViewController: UIViewController {
    //MARK: Properties
    @IBOutlet var imgLogo: UIImageView!
    @IBOutlet var sideMenuTableView: UITableView!
    @IBOutlet var lblCity: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    
    
    var delegate: SideMenuViewControllerDelegate?

    var defaultHighlightedCell: Int = 0
    
    var menu: [SideMenuModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    
        menu = [
            SideMenuModel(title: "Màn hình chính"),
            SideMenuModel(title: "Hồ sơ cá nhân"),
            SideMenuModel(title: "Lịch trình"),
        ]
        
        // TableView
        self.sideMenuTableView.delegate = self
        self.sideMenuTableView.dataSource = self
        self.sideMenuTableView.backgroundColor = .white
        self.sideMenuTableView.separatorStyle = .none
        
        // Set Header
        self.imgLogo.layer.cornerRadius = self.imgLogo.frame.height / 2
        self.lblName.text = "Không Biết Tên"
        self.lblEmail.text = "khongbietten@gmail.com"
        self.lblCity.text = "Viet Nam"
        self.imgLogo.image = UIImage(named: "default")

        // Set Highlighted Cell
        DispatchQueue.main.async {
            let defaultRow = IndexPath(row: self.defaultHighlightedCell, section: 0)
            self.sideMenuTableView.selectRow(at: defaultRow, animated: false, scrollPosition: .none)
        }

        // Register TableView Cell
        self.sideMenuTableView.register(SideMenuCell.nib, forCellReuseIdentifier: SideMenuCell.identifier)

        // Update TableView with the data
        self.sideMenuTableView.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension SideMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

// MARK: - UITableViewDataSource

extension SideMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menu.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuCell.identifier, for: indexPath) as? SideMenuCell else { fatalError("xib doesn't exist") }
        
        // Add
        cell.titleLabel.text = self.menu[indexPath.row].title

        // Highlighted color background
//        let myCustomSelectionColorView = UIView()
//        myCustomSelectionColorView.backgroundColor = .darkGray
//        cell.selectedBackgroundView = myCustomSelectionColorView
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.delegate?.selectedCell(indexPath.row)
        
        // Remove highlighted color when you press the 'Profile' and 'Like us on facebook' cell
//        if indexPath.row == 1 {
//            tableView.deselectRow(at: indexPath, animated: true)
//        }
    }

}
