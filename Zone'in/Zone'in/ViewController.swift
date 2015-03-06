//
//  ViewController.swift
//  Zone'in
//
//  Created by Rean on 3/5/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var moreTimeBtn: UIButton!
    @IBOutlet weak var lessTimeBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var estTimeLabel: UILabel!
    @IBOutlet weak var CountingLabel: UILabel!
    
    var timer = NSTimer()
    var counter: Int = 0
    var estTimeVar: Int = 30
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func moreTimeAction(sender: AnyObject) {
        if estTimeVar <= 50{
            estTimeVar += 10
            estTimeLabel.text = String(estTimeVar)+" Mins"
        }
    }

    @IBAction func lessTimeAction(sender: AnyObject) {
        if estTimeVar >= 10{
            estTimeVar -= 10
            estTimeLabel.text = String(estTimeVar)+" Mins"
        }
    }
    
    @IBAction func startCountingAction(sender: AnyObject) {
        moreTimeBtn.hidden = true
        lessTimeBtn.hidden = true
        
        counter = estTimeVar * 60
        
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
        
        CountingLabel.text = "\(strMinutes):\(strSeconds)"
        
        counter--
    }
    
}

