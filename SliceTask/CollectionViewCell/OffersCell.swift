//
//  OffersCell.swift
//  SliceTask
//
//  Created by sathish on 01/11/20.
//  Copyright © 2020 sathish. All rights reserved.
//

import UIKit

class OffersCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var sellerView: UIView! {
        didSet {
            sellerView.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var sellerImage: UIImageView!
    @IBOutlet weak var offerView: UIView! {
        didSet {
            offerView.layer.cornerRadius = 5
        }
    }
    @IBOutlet weak var offerValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
