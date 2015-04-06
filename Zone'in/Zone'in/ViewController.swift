//
//  ViewController.swift
//  Zone'in
//
//  Created by Rean on 3/5/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stateLabel: UILabel!
    
    @IBOutlet weak var moreTimeBtn: UIButton!
    @IBOutlet weak var lessTimeBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var estTimeLabel: UILabel!
    @IBOutlet weak var countingLabel: UILabel!
    
    var timer = NSTimer()
    var counter: Int = 0
    var estTimeVar: Int = 30
    let sharedData:Singleton = Singleton.sharedInstance
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initTimer()
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
        startCounting()

    }
    func startCounting(){
        moreTimeBtn.hidden = true
        lessTimeBtn.hidden = true
        countingLabel.hidden = false
        startBtn.hidden = true
        stopBtn.hidden = false
        stateLabel.hidden = true
        
        sharedData.isFailed = false
        
        counter = estTimeVar * 60
        
        if !timer.valid{
            let aSelector: Selector = "updateTime"
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: aSelector, userInfo: nil, repeats: true)
        }
    }
    
    

    @IBAction func stopCountingAction(sender: AnyObject) {
        let alert = UIAlertController(title: "Hey!",
            message: "Do you really want to stop this time?", preferredStyle: .Alert)
        let actionYES = UIAlertAction(title: "Yes", style: .Default, handler: {action in self.failCounting()})
        let actionNO = UIAlertAction(title: "No", style: .Default, handler: nil)
        alert.addAction(actionYES)
        alert.addAction(actionNO)
        presentViewController(alert, animated: true, completion: nil)
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
        
        countingLabel.text = "\(strMinutes):\(strSeconds)"
        
        counter--
        
        if counter == 0{
            initTimer()
            updateStateLabel("success this time")
        }
        
        if sharedData.isFailed == true{
            println("here")
            failCounting()
        }
    }

    func initTimer(){
        
        counter = 0
        estTimeVar = 30
        timer.invalidate()
        
        countingLabel.hidden = true
        stateLabel.hidden = true
        startBtn.hidden = false
        stopBtn.hidden = true
        moreTimeBtn.hidden = false
        lessTimeBtn.hidden = false
        
        estTimeLabel.text = String(estTimeVar)+" Mins"
        
    }
    
    func updateStateLabel(str:String){
        stateLabel.text = str
        stateLabel.hidden = false

    }
    
    @IBAction func test1Min(sender: AnyObject) {
        estTimeVar = 1
        estTimeLabel.text = String(estTimeVar)+" Mins"
        startCounting()
    }
    
    func failCounting() -> Void{
        sharedData.isFailed = false
        initTimer()
        updateStateLabel("fail this time!")
    }

}

