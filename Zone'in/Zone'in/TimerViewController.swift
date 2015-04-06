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
    
//    var minsVal: Int = 0
//    var secsVal: Int = 0
    var timer = NSTimer()
    var counter: Int = 0
    let sharedData: Singleton = Singleton.sharedInstance
    var prize: Prize = .Fish
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startCounting(counter)
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
        }
        
        if sharedData.isFailed == true{
            //failed
        }
    }
    
    func updateLabel(mins: String, secs: String) {
        minsLabel.text = mins
        secsLabel.text = secs
    }

}
