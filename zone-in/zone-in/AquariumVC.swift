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
    
    var timer = Timer()
    var counter = 0
    
    let singleton = Singleton.sharedInstance
    let pref = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maskView.frame = self.view.frame
        maskView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        
        infobackGroundImage.layer.cornerRadius = 20
        
//        startCounting(0)
        NotificationCenter.default.addObserver(self, selector: #selector(viewWillAppear), name: NSNotification.Name(rawValue: "com.zonein.lockcomplete"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(viewWillAppear), name: NSNotification.Name(rawValue: "com.zonein.homeButtonPressed"), object: nil)

        loadImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
        NotificationCenter.default.removeObserver(self)
    }
    
    func showOneFish(_ fishImage: UIImageView){
        // randomly create a value between 0.0 and 150.0
        let randomYOffset = CGFloat( arc4random_uniform(150))
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: -50,y: 239 + randomYOffset))
        path.addCurve(to: CGPoint(x: 317 + 157, y: 239 + randomYOffset), controlPoint1: CGPoint(x: 136, y: 373 + randomYOffset), controlPoint2: CGPoint(x: 178, y: 110 + randomYOffset))
        
        // create a new CAKeyframeAnimation that animates the objects position
        let anim = CAKeyframeAnimation(keyPath: "position")
        
        // set the animations path to our bezier curve
        anim.path = path.cgPath
        
        // set some more parameters for the animation
        // this rotation mode means that our object will rotate so that it's parallel to whatever point it is currently on the curve
        anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = Float.infinity
        anim.duration = Double(arc4random_uniform(40)+30) / 10
        anim.timeOffset = Double(arc4random_uniform(290))
        
        // we add the animation to the squares 'layer' property
        fishImage.layer.add(anim, forKey: "animate position along path")
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
        view.bringSubview(toFront: infobackGroundImage)
        view.bringSubview(toFront: totalLengthTitle)
        view.bringSubview(toFront: totalTimesTitle)
        view.bringSubview(toFront: continuesDaysTitle)
        view.bringSubview(toFront: lengthLabel)
        view.bringSubview(toFront: timesLabel)
        view.bringSubview(toFront: daysLabel)
        view.bringSubview(toFront: backBtn)
    }
    
    func updateSeaweed() {
        let times = pref.integer(forKey: "com.zone.totalTimes")
        amountLabel.text = String(times)
    }
    
    func updateTotalLength() {
        let length = pref.integer(forKey: "com.zonein.totalLength")
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
        if let lastUsedDay = pref.string(forKey: "com.zonein.lastUseDay") , lastUsedDay.characters.count != 0{
            print("lastusedday", lastUsedDay)
            timesLabel.text = lastUsedDay
        } else {
            timesLabel.text = "Make a move today!"
        }
    }
    
    func updateContinues() {
        // check and update continues days
        let yesterday = (Calendar.current as NSCalendar).date(byAdding: NSCalendar.Unit.day, value: -1, to: Date(), options: NSCalendar.Options.init(rawValue: 0))
        let yesterdayStr = singleton.dateFormat.string(from: yesterday!)
        let todayStr = singleton.dateFormat.string(from: Date())
        if let record = pref.string(forKey: "com.zonein.lastUseDay") {
            if record == yesterdayStr || record == todayStr {
                
            } else {
                pref.set(0, forKey: "com.zonein.continusDays")
            }
        }
        
        // update label
        let continuesDay = String(pref.integer(forKey: "com.zonein.continusDays"))
        daysLabel.text = continuesDay
    }
    @IBAction func backAct(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
}
