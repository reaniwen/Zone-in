//
//  AquariumVC.swift
//  zone-in
//
//  Created by Rean on 2/17/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit

class AquariumVC: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var infobackGroundImage: UIImageView!
    @IBOutlet weak var seaweedBackImage: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var totalLengthTitle: UILabel!
    @IBOutlet weak var totalTimesTitle: UILabel!
    @IBOutlet weak var continuesDaysTitle: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var timesLabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    
    @IBOutlet weak var amountLabel: UILabel!
    
    
    let babyFish = UIImageView(frame: CGRect(x: -50, y: 0, width: 105, height: 78))
    let adultFish = UIImageView(frame: CGRect(x: -50, y: 0, width: 149, height: 81))
    let sharkFish = UIImageView(frame: CGRect(x: -50, y: 0, width: 141, height: 92))
    
    let maskView = UIImageView()
    
    var timer = NSTimer()
    var counter = 0
    
    let singleton = Singleton.sharedInstance
    let pref = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maskView.frame = self.view.frame
        maskView.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.4)
        
        infobackGroundImage.layer.cornerRadius = 20
        
//        startCounting(0)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(viewWillAppear), name: "com.zonein.lockcomplete", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(viewWillAppear), name: "com.zonein.homeButtonPressed", object: nil)

        loadImage()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        showOneFish(babyFish)
        showOneFish(adultFish)
        showOneFish(sharkFish)
        
        updateSeaweed()
        updateTotalLength()
//        updateTotalTimes()
        updateLastUsedDay()
        updateContinues()
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func showOneFish(fishImage: UIImageView){
        // randomly create a value between 0.0 and 150.0
        let randomYOffset = CGFloat( arc4random_uniform(150))
        
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: -50,y: 239 + randomYOffset))
        path.addCurveToPoint(CGPoint(x: 317 + 157, y: 239 + randomYOffset), controlPoint1: CGPoint(x: 136, y: 373 + randomYOffset), controlPoint2: CGPoint(x: 178, y: 110 + randomYOffset))
        
        // create a new CAKeyframeAnimation that animates the objects position
        let anim = CAKeyframeAnimation(keyPath: "position")
        
        // set the animations path to our bezier curve
        anim.path = path.CGPath
        
        // set some more parameters for the animation
        // this rotation mode means that our object will rotate so that it's parallel to whatever point it is currently on the curve
        anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = Float.infinity
        anim.duration = Double(arc4random_uniform(40)+30) / 10
        anim.timeOffset = Double(arc4random_uniform(290))
        
        // we add the animation to the squares 'layer' property
        fishImage.layer.addAnimation(anim, forKey: "animate position along path")
    }

    func loadImage() {
        backgroundImage.image = UIImage(named: "cleanAquarium")
        babyFish.image = UIImage(named: "f_babyfish1")
        adultFish.image = UIImage(named: "f_adultfish1")
        sharkFish.image = UIImage(named: "f_shark1")
        
        view.addSubview(babyFish)
        view.addSubview(adultFish)
        view.addSubview(sharkFish)
        view.addSubview(maskView)
        view.bringSubviewToFront(infobackGroundImage)
        view.bringSubviewToFront(totalLengthTitle)
        view.bringSubviewToFront(totalTimesTitle)
        view.bringSubviewToFront(continuesDaysTitle)
        view.bringSubviewToFront(lengthLabel)
        view.bringSubviewToFront(timesLabel)
        view.bringSubviewToFront(daysLabel)
        view.bringSubviewToFront(backBtn)
    }
    
    func updateSeaweed() {
        let times = pref.integerForKey("com.zone.totalTimes")
        amountLabel.text = String(times)
    }
    
    func updateTotalLength() {
        let length = pref.integerForKey("com.zonein.totalLength")
        let secs = length % 60
        let totalmins = (length - secs) / 60
        let mins = totalmins % 60
        let hrs = (totalmins - mins) / 60
        var minsStr = ""
        if mins < 10 {
            minsStr = "0"+String(mins)
        } else {
            minsStr = String(mins)
        }
        var secsStr = ""
        if secs < 10 {
            secsStr = "0" + String(secs)
        } else {
            secsStr = String(secs)
        }
        lengthLabel.text = String(hrs) + ":" + minsStr + ":" + secsStr
    }
    
//    func updateTotalTimes() {
//        let times = pref.integerForKey("com.zone.totalTimes")
//        timesLabel.text = String(times)
//    }
    
    func updateLastUsedDay() {
        if let lastUsedDay = pref.stringForKey("com.zonein.lastUseDay") where lastUsedDay.characters.count != 0{
            print("lastusedday", lastUsedDay)
            timesLabel.text = lastUsedDay
        } else {
            timesLabel.text = "Make a move today!"
        }
    }
    
    func updateContinues() {
        // check and update continues days
        let yesterday = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Day, value: -1, toDate: NSDate(), options: NSCalendarOptions.init(rawValue: 0))
        let yesterdayStr = singleton.dateFormat.stringFromDate(yesterday!)
        let todayStr = singleton.dateFormat.stringFromDate(NSDate())
        if let record = pref.stringForKey("com.zonein.lastUseDay") {
            if record == yesterdayStr || record == todayStr {
                
            } else {
                pref.setInteger(0, forKey: "com.zonein.continusDays")
            }
        }
        
        // update label
        let continuesDay = String(pref.integerForKey("com.zonein.continusDays"))
        daysLabel.text = continuesDay
    }
    @IBAction func backAct(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}