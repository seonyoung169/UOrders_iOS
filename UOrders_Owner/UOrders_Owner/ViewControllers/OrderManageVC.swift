//
//  OrderManageVC.swift
//  UOrders_Owner
//
//  Created by SEONYOUNG LEE on 2020/11/16.
//

import UIKit

struct Order {
    var customerName : String
    var orderNumber : String
    var leftTime : String
}

class OrderManageVC: UIViewController {
    
    let orderList = [Order(customerName : "시연 님", orderNumber: "(No. 17)", leftTime: "13 분"),
                     Order(customerName : "종근 님", orderNumber: "(No. 18)", leftTime: "25 분"),
                     Order(customerName : "영서 님", orderNumber: "(No. 19)", leftTime: "34 분"),
                     Order(customerName : "선영 님", orderNumber: "(No. 20)", leftTime: "40 분"),
                     Order(customerName : "시연 님", orderNumber: "(No. 21)", leftTime: "45 분")
                     ]

    @IBOutlet weak var orderCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setOrderTableView()
    }
    
    func setOrderTableView() {
        orderCollectionView.dataSource = self
        orderCollectionView.delegate = self
        
        
        let orderLayout = UICollectionViewFlowLayout()
        orderLayout.minimumLineSpacing = 0
        orderLayout.minimumInteritemSpacing = 0
        orderLayout.sectionInset = UIEdgeInsets.zero
        orderLayout.itemSize = CGSize(width: self.view.frame.width, height : 200)
        orderCollectionView.collectionViewLayout = orderLayout
    }

}

extension OrderManageVC : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.orderList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "orderCollectionViewCell", for: indexPath) as! OrderCollectionViewCell
        
        cell.customerNameLabel.text = orderList[indexPath.row].customerName
        cell.orderNumberLabel.text = orderList[indexPath.row].orderNumber
        cell.leftTimeLabel.text = orderList[indexPath.row].leftTime
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.orderList.count
    }
}

//extension OrderManageVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "orderCollectionViewCell", for: indexPath)
//        
//        return cell
//    }
//    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return self.orderList.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        return CGSize(width: orderCollectionView.frame.width, height: 200)
//    }
//}

