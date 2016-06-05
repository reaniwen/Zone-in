//
//  TutorialLastVC.swift
//  zone-in
//
//  Created by Rean on 2/3/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit

class TutorialLastVC: UIViewController {
    
    let userDefaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet weak var gjLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = userDefaults.stringForKey("com.zonein.userName") {
            gjLabel.text = "Good job, \(name)!"
        } else {
            gjLabel.text = "Good Job!"
        }

        // Do any additional setup after loading the view.
    }

}
