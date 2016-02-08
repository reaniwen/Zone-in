//
//  TutorialSetVC.swift
//  zone-in
//
//  Created by Rean on 2/3/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit

class TutorialSetVC: UIViewController {
    
    let userDefaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet weak var hiLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = userDefaults.stringForKey("com.zonein.userName") {
            hiLabel.text = "Hi, \(name) !"
        }else {
            hiLabel.text = "Hi!"
        }
        
        // Do any additional setup after loading the view.
    }
    
    
}
