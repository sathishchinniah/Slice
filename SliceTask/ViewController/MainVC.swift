//
//  MainVC.swift
//  SliceTask
//
//  Created by sathish on 01/11/20.
//  Copyright © 2020 sathish. All rights reserved.
//

import UIKit
import SwiftyJSON

class MainVC: UIViewController, DetailOffersDelegate {

    @IBOutlet weak var headerView: UIView! {
        didSet {
            headerView.clipsToBounds = true
            headerView.layer.cornerRadius = 10
            headerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        }
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var offersList = [[OffersModel]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func detailOffer(_ data: OffersModel) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        vc.OfferDetail = data
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

//MARK: - UITableView DataSource

extension MainVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offersList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OffersMainTableViewCell", for: indexPath) as! OffersMainTableViewCell
        cell.allOffers = offersList[indexPath.row]
        cell.delegate = self
        cell.collectionView.reloadData()
        return cell
    }

}

//MARK: - Json Data Parse

extension MainVC {
    
    func loadData() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        guard let url = Bundle.main.url(forResource: "Data", withExtension: "json"), let jsonData = NSData(contentsOf: url) else {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
          print("Error finding JSON File")
          return
        }
        
        do {
            let jsonObject = try JSON(data: jsonData as Data)
            let offersData = jsonObject["data"].arrayValue
            for offersArray in offersData {
                let offersValue = offersArray.arrayValue
                var offers = [OffersModel]()
                for offer in offersValue {
                    let voucherCode = offer["voucherCode"].stringValue
                    let voucherDesc = offer["voucherDesc"].stringValue
                    let discountTitle = offer["discountTitle"].stringValue
                    let discountDesc = offer["discountDesc"].stringValue
                    let validTill = offer["validTill"].stringValue
                    let isExpiringSoon = offer["isExpiringSoon"].boolValue
                    let discount = offer["discount"].stringValue
                    let seller = offer["seller"].stringValue
                    let shareData = offer["shareData"].stringValue
                    let offer = OffersModel(voucherCode: voucherCode, voucherDesc: voucherDesc, discountTitle: discountTitle, discountDesc: discountDesc, validTill: validTill, isExpiringSoon: isExpiringSoon, discount: discount, seller: seller, shareData: shareData)
                    offers.append(offer)
                }
                offersList.append(offers)
            }
             activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
        } catch {
            print("Response Error")
        }
    }
}
