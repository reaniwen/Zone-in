//
//  TutorialLastVC.swift
//  zone-in
//
//  Created by Rean on 2/3/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit

class TutorialLastVC: UIViewController {
    
    let userDefaults = NSUserDefaults.standardUserDefaults()

    
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var infobackGroundImage: UIImageView!
    
    @IBOutlet weak var gjLabel: UILabel!
    @IBOutlet weak var kLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var okBtn: UIButton!
    
    
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
        
        if let name = userDefaults.stringForKey("com.zonein.userName") {
            gjLabel.text = "Good job, \(name)!"
        } else {
            gjLabel.text = "Good Job!"
        }
        
        maskView.frame = self.view.frame
        maskView.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.4)
        
        infobackGroundImage.layer.cornerRadius = 20
        
        loadImage()
    }
    
    override func viewWillAppear(animated: Bool) {
        showOneFish(babyFish)
        showOneFish(adultFish)
        showOneFish(sharkFish)
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
        view.bringSubviewToFront(gjLabel)
        view.bringSubviewToFront(kLabel)
        view.bringSubviewToFront(aLabel)
        view.bringSubviewToFront(okBtn)
    }

    @IBAction func finishAct(sender: AnyObject) {
        print("here")
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "com.zonein.oldUser")
    }
    
    
}