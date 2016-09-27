//
//  TutorialLastVC.swift
//  zone-in
//
//  Created by Rean on 2/3/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit

class TutorialLastVC: UIViewController {
    
    let userDefaults = UserDefaults.standard

    
    
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
    
    var timer = Timer()
    var counter = 0
    
    let singleton = Singleton.sharedInstance
    let pref = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = userDefaults.string(forKey: "com.zonein.userName") {
            gjLabel.text = "Good job, \(name)!"
        } else {
            gjLabel.text = "Good Job!"
        }
        
        maskView.frame = self.view.frame
        maskView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        
        infobackGroundImage.layer.cornerRadius = 20
        
        loadImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showOneFish(babyFish)
        showOneFish(adultFish)
        showOneFish(sharkFish)
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
        view.bringSubview(toFront: gjLabel)
        view.bringSubview(toFront: kLabel)
        view.bringSubview(toFront: aLabel)
        view.bringSubview(toFront: okBtn)
    }

    @IBAction func finishAct(_ sender: AnyObject) {
        print("here")
        UserDefaults.standard.set(true, forKey: "com.zonein.oldUser")
    }
    
    
}
