//
//  StoreManageViewController.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/11/25.
//

import UIKit

class StoreManageVC: UIViewController {
    
    @IBOutlet weak var storeTableView: UITableView!
    @IBOutlet weak var menuAddButton: UIButton!
    
    var storeTableData : CafeMenuDataResult!{
        didSet {storeTableView.reloadData()}
    }
    
    override func viewDidLoad() {
        print("viewDidLoad")
        setStoreTableView()
        super.viewDidLoad()
        
        API.shared.getStoreManageMain() {
            result in
            switch result {
            case .success(let successData) :
                print(".success")
                guard successData.self != nil else { return }
                self.storeTableData = successData
            case .failure(let error) :
                print("getStoreManageMain Error", error)
                
            }
        }
        
    }
    
    func setStoreTableView() {
        storeTableView.delegate = self
        storeTableView.dataSource = self
        storeTableView.tableFooterView = UIView()
    }
    
    func setAddButton() {
        NSLayoutConstraint.activate([
            menuAddButton.bottomAnchor.constraint(equalTo: storeTableView.frameLayoutGuide.bottomAnchor, constant: -30),
            menuAddButton.trailingAnchor.constraint(equalTo: storeTableView.frameLayoutGuide.trailingAnchor, constant: -30)
        ])
    }
    
    @IBAction func showMenuAddVC(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "MenuAddStoryBoard") else { return }
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .overCurrentContext
        
        self.parent?.present(vc, animated: false, completion: nil)
    }
    
}

extension StoreManageVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if let rowData = self.storeTableData {
            print("here")
            return rowData.data.menuInfo.count
        }else{
            print("0")
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storeTableViewCell", for: indexPath) as! StoreTableViewCell
        
        cell.menuPhotoImage.layer.cornerRadius = cell.menuPhotoImage.frame.width/2
        cell.clipsToBounds = true
        cell.menuNameLabel.text = storeTableData.data.menuInfo[indexPath.row].menuName
        cell.menuPriceLabel.text = "\(storeTableData.data.menuInfo[indexPath.row].menuPrice)원"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
