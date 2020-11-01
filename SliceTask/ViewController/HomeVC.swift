//
//  HomeVC.swift
//  SliceTask
//
//  Created by sathish on 01/11/20.
//  Copyright © 2020 sathish. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var homeOfferBtn: UIButton! {
        didSet {
            homeOfferBtn.layer.cornerRadius = 10
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    @IBAction func goToTopOffers(_ sender: Any) {
          let vc = self.storyboard?.instantiateViewController(withIdentifier: "MainVC") as! MainVC
          self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
