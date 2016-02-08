//
//  MainTimerVC.swift
//  zone-in
//
//  Created by Rean on 1/31/16.
//  Copyright © 2016 Rean. All rights reserved.
//

// ToDo: Terminate Timer when jump to other page

import UIKit

class MainTimerVC: UIViewController, SyncTimerDelegate {
    
    var timer = NSTimer()
    var counter = 30 * 60
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    @IBOutlet weak var minsLabel: UILabel!
    @IBOutlet weak var secsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        startCounting(counter)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "homePressedAct", name: "com.zonein.homeButtonPressed", object: nil)
        
        appDelegate.delegate = self
    }

    
    func startCounting(counter: Int) {
        if !self.timer.valid {
            let aSelector: Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: aSelector, userInfo: nil, repeats: true)
        }
    }
    
    func updateTime() {
        updateTimeLabels()
        // Success
        if counter <= 0{
            // Todo: add prize
            timer.invalidate()
            self.performSegueWithIdentifier("toSucceedSegue", sender: self)
        }
        
        // Failed
        
        
        NSLog(String(self.counter))
        self.counter--
    }
    
    func updateTimeLabels(){
        let minutes = Int(counter / 60)
        let seconds = counter - minutes * 60
        
        let strMinutes = (minutes > 9) ? String(minutes) : "0" + String(minutes)
        minsLabel.text = strMinutes
        
        let strSeconds = (seconds > 9) ? String(seconds) : "0" + String(seconds)
        secsLabel.text = strSeconds
    }
    
    func homePressedAct() {
        print("timer received that the home is pressed")
        
        // Todo change failed to jump to fail view controller
        failed()
    }

    
    func failed() {
        // stop the timer
        self.timer.invalidate()
        
        // remove the observer
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
        // back to main menu
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    func getCurrentCount() -> Int{
        return self.counter
    }
    
    func setNewCount(count: Int) {
        print("change the count to \(count)")
        self.counter = count
    }
    
    
    // Back from hesitating
    @IBAction func backToTimer(segue:UIStoryboardSegue){
    }
    
    // Use unwind segue to terminate timer and unwind back to selectTimerVC
    @IBAction func backToTerminateTimer(segue: UIStoryboardSegue) {
        failed()
    }
    
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    
/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "backToMainSegue" {
            if let selectTimeVC = segue.destinationViewController as? SelectTimeVC {
                selectTimeVC.time = 60
                selectTimeVC.updateTime()
                print("Oops")
            }
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
*/


}

protocol SyncTimerDelegate{
    func getCurrentCount() -> Int
    func setNewCount(count: Int)
}
