//
//  MainTimerVC.swift
//  zone-in
//
//  Created by Rean on 1/31/16.
//  Copyright © 2016 Rean. All rights reserved.
//

// ToDo: Terminate Timer when jump to other page

import UIKit

class MainTimerVC: UIViewController {
    
    @IBOutlet weak var cloud: UIImageView!
    @IBOutlet weak var tankImage: UIImageView!
    @IBOutlet weak var seaweedImage: UIImageView!
    @IBOutlet weak var waterImage: UIImageView!
    
    
    var timer = NSTimer()
    var counter = 30 * 60
    var estCounter: Int?
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let pref = NSUserDefaults.standardUserDefaults()
    let singleton = Singleton.sharedInstance
    
    var thisTimeLength: Int = 0
    
    @IBOutlet weak var minsLabel: UILabel!
    @IBOutlet weak var secsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImage()

        // Do any additional setup after loading the view.
        estCounter = counter / 22
        if estCounter == 0 {
            estCounter = 1
        }
        startCounting(counter)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(homePressedAct), name: "com.zonein.homeButtonPressed", object: nil)
        
        appDelegate.delegate = self
        
        thisTimeLength = counter
    }
    
    func loadImage() {
        cloud.image = UIImage(named: "2.cloud")
        
        tankImage.image = UIImage(named: "fishtank22")
        waterImage.image = UIImage(named: "water22")
        // Todo make seeweed image animate
        seaweedImage.image = UIImage(named: "2.seaWeed")
        
    }

    
    func startCounting(counter: Int) {
        if !self.timer.valid {
            let aSelector: Selector = #selector(updateTime)
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: aSelector, userInfo: nil, repeats: true)
        }
    }
    
    func updateTime() {
        updateTimeLabels()
        updateTankImage()
        // Success
        if counter <= 0{
            // Todo: update continus days and last used day
            updateData()
            timer.invalidate()
            self.performSegueWithIdentifier("toSucceedSegue", sender: self)
        }
        
        NSLog(String(self.counter))
        self.counter -= 1
    }
    
    func updateTimeLabels(){
        let minutes = Int(counter / 60)
        let seconds = counter - minutes * 60
        
        let strMinutes = (minutes > 9) ? String(minutes) : "0" + String(minutes)
        minsLabel.text = strMinutes
        
        let strSeconds = (seconds > 9) ? String(seconds) : "0" + String(seconds)
        secsLabel.text = strSeconds
    }
    
    func updateTankImage() {
        if let estCounter = estCounter {
            let num: Int = counter / estCounter
            print(estCounter,num)
            let currTankImage: UIImage = UIImage(named: "fishtank\(num)")!
            let currWaterImage: UIImage = UIImage(named: "water\(num)")!
            tankImage.image = currTankImage
            waterImage.image = currWaterImage
        }
    }
    
    func homePressedAct() {
        print("timer received that the home is pressed")

        self.performSegueWithIdentifier("toFailedSegue", sender: self)
//        failed()
    }

    
    func failed() {
        // stop the timer
        self.timer.invalidate()
        
        // back to main menu
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    func updateData() {
        // check and update continues days
        let yesterday = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Day, value: -1, toDate: NSDate(), options: NSCalendarOptions.init(rawValue: 0))
        let yesterdayStr = singleton.dateFormat.stringFromDate(yesterday!)
        let todayStr = singleton.dateFormat.stringFromDate(NSDate())
        if let record = pref.stringForKey("com.zonein.lastUseDay") {
            if record == yesterdayStr {
                let continuesDays = pref.integerForKey("com.zonein.continusDays") + 1
                pref.setInteger(continuesDays, forKey: "com.zonein.continusDays")
                pref.setObject(todayStr, forKey: "com.zonein.lastUseDay")
            } else if record == todayStr {
                // do nothing
            } else {
                pref.setInteger(1, forKey: "com.zonein.continusDays")
                pref.setObject(todayStr, forKey: "com.zonein.lastUseDay")
            }
        } else {
            pref.setInteger(1, forKey: "com.zonein.continusDays")
            pref.setObject(todayStr, forKey: "com.zonein.lastUseDay")
        }
        let totalLength = pref.integerForKey("com.zonein.totalLength") + thisTimeLength
        pref.setInteger(totalLength, forKey: "com.zonein.totalLength")
//        let continuesDay = String(pref.integerForKey("com.zonein.continusDays"))
        // Update total times
        let times = pref.integerForKey("com.zone.totalTimes") + 1
        pref.setInteger(times, forKey: "com.zone.totalTimes")
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

extension MainTimerVC: SyncTimerDelegate {
    func getCurrentCount() -> Int{
        return self.counter
    }
    
    func setNewCount(count: Int) {
        print("change the count to \(count)")
        self.counter = count
    }
}

protocol SyncTimerDelegate{
    func getCurrentCount() -> Int
    func setNewCount(count: Int)
}
