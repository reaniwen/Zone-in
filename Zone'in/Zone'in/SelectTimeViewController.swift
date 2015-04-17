//
//  SelectTimeViewController.swift
//  Zone'in
//
//  Created by Rean on 3/27/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class SelectTimeViewController: UIViewController {
    @IBOutlet weak var backTimerImage: UIImageView!
    
    let sharedData:Singleton = Singleton.sharedInstance

    @IBOutlet weak var moreTimeBtn: UIButton!
    @IBOutlet weak var lessTimeBtn: UIButton!
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    var time: Int = 30
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        loadImage()
        updateTime(time)
        
    }

    @IBAction func moreTimeAction(sender: AnyObject) {
        if time <= 60 {
            time += 10
            updateTime(time)
        }
    }

    @IBAction func lessTimeAction(sender: AnyObject) {
        if time >= 30 {
            time -= 10
            updateTime(time)
        }
    }
    
    func updateTime(time: Int){
        sharedData.time = time
        timeLabel.text = "\(time)"
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DemoTimerSegue" {
            if let destinationVC = segue.destinationViewController as? TimerViewController {
                //only could change vark, not UI element
                destinationVC.counter = 20
                destinationVC.prize = Prize.Fish
                destinationVC.sharedData.isFailed = false
                destinationVC.sharedData.isLocked = false
            }
        }
    }
    
    func loadImage() {
        backTimerImage.image = UIImage(named: "1.BackgroundofTimer")
//        moreTimeBtn.imageView?.image = UIImage(named: "1.more")
        moreTimeBtn.setImage(UIImage(named: "1.more"), forState: UIControlState.Normal)
//        lessTimeBtn.imageView?.image = UIImage(named: "1.less")
        lessTimeBtn.setImage(UIImage(named: "1.less"), forState: .Normal)
    
    }
    
    
    //this is the demo for prepareForSegue
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "SelectPrizeSegue" {
//            if let destinationVC = segue.destinationViewController as? SelectPrizeViewController {
//                //only could change vark, not UI element
//                destinationVC.testText = "Test Send MSG"
//            }
//        }
//    }

}
