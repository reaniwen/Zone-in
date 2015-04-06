//
//  TimerViewController.swift
//  Zone'in
//
//  Created by Rean on 3/27/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var minsLabel: UILabel!
    @IBOutlet weak var secsLabel: UILabel!
    @IBOutlet weak var fishTankImage: UIImageView!
    
//    var minsVal: Int = 0
//    var secsVal: Int = 0
    var timer = NSTimer()
    var counter: Int = 0
    let sharedData: Singleton = Singleton.sharedInstance
    var prize: Prize = .Fish
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startCounting(counter)
        var image = UIImage(named: "3.1")
        fishTankImage.image = image
    }
    
    func startCounting(counter: Int){
        if !timer.valid{
            let aSelector: Selector = "updateTime"
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: aSelector, userInfo: nil, repeats: true)
        }
    }
    
    func updateTime(){
        
        let minutes = Int(counter / 60)
        
        //        elapsedTime -= (NSTimeInterval(minutes)*60)
        
        let seconds = counter - minutes * 60
        
        var strMinutes = "00"
        if minutes > 9 {
            strMinutes = String(minutes)
        }else{
            strMinutes = "0" + String(minutes)
        }
        
        var strSeconds = "00"
        if seconds > 9 {
            strSeconds = String(seconds)
        }else{
            strSeconds = "0" + String(seconds)
        }
        
        updateLabel(strMinutes, secs: strSeconds)
//        countingLabel.text = "\(strMinutes):\(strSeconds)"
        
        counter--
        
        if counter == 0{
            //success
            self.performSegueWithIdentifier("SucceedSegue", sender: self)
        }
        
        if sharedData.isFailed == true{
            //failed
            self.performSegueWithIdentifier("LoseSegue", sender: self)
            timer.invalidate()
        }
        
        if counter <= 15 {
            let image = UIImage(named: "3.2")
            fishTankImage.image = image
        }
        if counter <= 10 {
            let image = UIImage(named: "3.3")
            fishTankImage.image = image
        }
        if counter <= 5 {
            let image = UIImage(named: "3.4")
            fishTankImage.image = image
        }
    }
    
    func updateLabel(mins: String, secs: String) {
        minsLabel.text = mins
        secsLabel.text = secs
    }

}
