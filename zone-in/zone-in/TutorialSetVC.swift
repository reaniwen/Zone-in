//
//  TutorialSetVC.swift
//  zone-in
//
//  Created by Rean on 2/3/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit

class TutorialSetVC: UIViewController {
    
    @IBOutlet weak var cloudImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var moreArrawLabel: UILabel!
    @IBOutlet weak var lessArrawLabel: UILabel!
    @IBOutlet weak var goalArrawLabel: UILabel!
    
    var time: Int = 30
    
    let userDefaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet weak var hiLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = userDefaults.stringForKey("com.zonein.userName") {
            hiLabel.text = "Hi, \(name) !"
        }else {
            hiLabel.text = "Hi!"
        }
        
        cloudImage.image = UIImage(named: "1.setTimerCloud")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        hiLabel.moveLeftRight()
        moreArrawLabel.moveLeftRight()
        lessArrawLabel.moveLeftRight()
        goalArrawLabel.moveRightLeft()
    }
    
    @IBAction func moreTimeAct(sender: AnyObject) {
        if time < 60 {
            time += 10
            updateTime()
        }
    }
    
    @IBAction func lessTimeAct(sender: AnyObject) {
        if time > 10 {
            time -= 10
            updateTime()
        }
    }
    
    func updateTime(){
        self.timeLabel.text = String(self.time)
    }
    
    
}
