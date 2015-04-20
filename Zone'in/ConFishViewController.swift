//
//  ConfirmFishViewController.swift
//  Zone'in
//
//  Created by Rean on 4/19/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class ConFishViewController: UIViewController {
    @IBOutlet weak var fishImage: UIImageView!
    var fish: FishClass = .Others

    override func viewDidLoad() {
        super.viewDidLoad()
        if fish == FishClass.BabyFish {
            fishImage.image = UIImage(named: "18.1.babyFish")
        }
        if fish == FishClass.AdultFish {
            fishImage.image = UIImage(named: "18.2.adultFish")
        }
        if fish == FishClass.Shark {
            fishImage.image = UIImage(named: "18.3.shark")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
