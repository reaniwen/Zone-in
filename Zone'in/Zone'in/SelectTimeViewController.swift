//
//  SelectTimeViewController.swift
//  Zone'in
//
//  Created by Rean on 3/27/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class SelectTimeViewController: UIViewController {
    
    let sharedData:Singleton = Singleton.sharedInstance

    @IBOutlet weak var moreTimeBtn: UIButton!
    @IBOutlet weak var lessTimeBtn: UIButton!
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    var time: Int = 30
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
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
            }
        }
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
