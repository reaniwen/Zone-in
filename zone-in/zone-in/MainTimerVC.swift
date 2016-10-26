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
    
    
    var timer = Timer()
    var counter = 30 * 60
    var estCounter: Int?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let pref = UserDefaults.standard
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(homePressedAct), name: NSNotification.Name(rawValue: "com.zonein.homeButtonPressed"), object: nil)
        
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

    
    func startCounting(_ counter: Int) {
        if !self.timer.isValid {
            let aSelector: Selector = #selector(updateTime)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: aSelector, userInfo: nil, repeats: true)
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
            self.performSegue(withIdentifier: "toSucceedSegue", sender: self)
        }
        
        print("Seconds remaining: ",String(self.counter))
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
    
    // todo: optimize this function, not to update image every second
    func updateTankImage() {
        if let estCounter = estCounter {
            let num: Int = counter / estCounter
//            print(estCounter,num)
            let currTankImage: UIImage = UIImage(named: "fishtank\(num)")!
            let currWaterImage: UIImage = UIImage(named: "water\(num)")!
            tankImage.image = currTankImage
            waterImage.image = currWaterImage
        }
    }
    
    func homePressedAct() {
        print("timer received that the home is pressed")

        self.performSegue(withIdentifier: "toFailedSegue", sender: self)
//        failed()
    }

    
    func failed() {
        // stop the timer
        self.timer.invalidate()
        
        // back to main menu
        self.dismiss(animated: false, completion: nil)
    }
    
    func updateData() {
        // check and update continues days
        let yesterday = (Calendar.current as NSCalendar).date(byAdding: NSCalendar.Unit.day, value: -1, to: Date(), options: NSCalendar.Options.init(rawValue: 0))
        let yesterdayStr = singleton.dateFormat.string(from: yesterday!)
        let todayStr = singleton.dateFormat.string(from: Date())
        if let record = pref.string(forKey: "com.zonein.lastUseDay") {
            if record == yesterdayStr {
                let continuesDays = pref.integer(forKey: "com.zonein.continusDays") + 1
                pref.set(continuesDays, forKey: "com.zonein.continusDays")
                pref.set(todayStr, forKey: "com.zonein.lastUseDay")
            } else if record == todayStr {
                // do nothing
            } else {
                pref.set(1, forKey: "com.zonein.continusDays")
                pref.set(todayStr, forKey: "com.zonein.lastUseDay")
            }
        } else {
            pref.set(1, forKey: "com.zonein.continusDays")
            pref.set(todayStr, forKey: "com.zonein.lastUseDay")
        }
        let totalLength = pref.integer(forKey: "com.zonein.totalLength") + thisTimeLength
        pref.set(totalLength, forKey: "com.zonein.totalLength")
//        let continuesDay = String(pref.integerForKey("com.zonein.continusDays"))
        // Update total times
        let times = pref.integer(forKey: "com.zone.totalTimes") + 1
        pref.set(times, forKey: "com.zone.totalTimes")
    }
    
    
    // Back from hesitating
    @IBAction func backToTimer(_ segue:UIStoryboardSegue){
    }
    
    // Use unwind segue to terminate timer and unwind back to selectTimerVC
    @IBAction func backToTerminateTimer(_ segue: UIStoryboardSegue) {
        failed()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
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
    
    func setNewCount(_ count: Int) {
        print("change the count to \(count)")
        self.counter = count
    }
}

protocol SyncTimerDelegate{
    func getCurrentCount() -> Int
    func setNewCount(_ count: Int)
}
