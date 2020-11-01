//
//  DetailVC.swift
//  SliceTask
//
//  Created by sathish on 01/11/20.
//  Copyright © 2020 sathish. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    var OfferDetail: OffersModel?
    
    @IBOutlet weak var itemImage: UIImageView!{
        didSet {
            itemImage.clipsToBounds = true
            itemImage.layer.cornerRadius = 20
            itemImage.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        }
    }
    @IBOutlet weak var sellerView: UIView! {
        didSet {
            sellerView.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var sellerImageView: UIImageView!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var discountDescLabel: UILabel!
    @IBOutlet weak var expiresView: UIView! {
        didSet {
            expiresView.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var discountCodeLabel: UILabel!
    @IBOutlet weak var discountCodeDescLabel: UILabel!
    @IBOutlet weak var vaidityLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    func updateData() {
        vaidityLabel.text = OfferDetail?.validTill
        discountCodeDescLabel.text = OfferDetail?.voucherDesc
        discountCodeLabel.text = OfferDetail?.voucherCode
        discountDescLabel.text = OfferDetail?.discountDesc
        discountLabel.text = OfferDetail?.discount
        
        switch OfferDetail?.seller {
        case "Swiggy":
            sellerImageView.image = UIImage(named: "swiggy")
        case "bookmyshow" :
             sellerImageView.image = UIImage(named: "bookmyshow")
        default:
            break;
        }
    }
    
    @IBAction func backBtnAction(_ sender: Any) {
        self.navigationController!.popToRootViewController(animated: true)
    }
    
    @IBAction func copyDiscountTap(_ sender: Any) {
         let pasteBoard = UIPasteboard.general
         pasteBoard.string = OfferDetail?.voucherCode
    }
    
    @IBAction func shareBtnTap(_ sender: Any) {

        let textToShare = [ OfferDetail?.shareData ]
        let activityViewController = UIActivityViewController(activityItems: textToShare as [Any], applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}
