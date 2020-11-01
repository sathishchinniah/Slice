//
//  OffersMainTableViewCell.swift
//  SliceTask
//
//  Created by sathish on 01/11/20.
//  Copyright © 2020 sathish. All rights reserved.
//

import UIKit
import SkeletonView

protocol DetailOffersDelegate: class {
    func detailOffer(_ data: OffersModel)
}

class OffersMainTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewTopConstraint: NSLayoutConstraint!
    var allOffers = [OffersModel]()
    weak var delegate: DetailOffersDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allOffers.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OffersCell", for: indexPath as IndexPath) as! OffersCell
        cell.offerValue.text = allOffers[indexPath.row].discount
        switch  allOffers[indexPath.row].seller {
        case "Swiggy":
            cell.sellerImage.image = UIImage(named: "swiggy")
            cell.imageView.image = UIImage(named: "pizza")
        case "bookmyshow" :
             cell.sellerImage.image = UIImage(named: "bookmyshow")
            cell.imageView.image = UIImage(named: "poster")
        default:
            break;
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.detailOffer(allOffers[indexPath.row])
    }

}
