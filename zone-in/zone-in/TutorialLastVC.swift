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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
