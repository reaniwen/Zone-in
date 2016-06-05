//
//  StoreViewController.swift
//  Zone'in
//
//  Created by Rean on 3/23/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class Store1ViewController: UIViewController {
    let sharedDate:Singleton = Singleton.sharedInstance
    
    var timer = NSTimer()
    var counter = 0

    let yPosition : CGFloat = CGFloat(0)//used to be 84
    
    let babyFish: fishImage = fishImage(image: UIImageView(),length: CGFloat(105), height: CGFloat(78))
    let adultFish: fishImage = fishImage(image: UIImageView(), length: CGFloat(149), height: CGFloat(81))
    let sharkFish: fishImage = fishImage(image: UIImageView(), length: CGFloat(141), height: CGFloat(92))

    @IBOutlet weak var backgroundImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startCounting(0)
        
        view.addSubview(babyFish.image)
        view.addSubview(adultFish.image)
        view.addSubview(sharkFish.image)
        
        loadImage()
    }
    
    override func viewDidAppear(animated: Bool) {
        showOneFish(babyFish.image)
        showOneFish(adultFish.image)
        showOneFish(sharkFish.image)
    }
    
    func loadImage(){
        backgroundImage.image = UIImage(named: "9.background")
    }

    
    func startCounting(counter: Int){
        if !timer.valid{
            let aSelector: Selector = "updateTime"
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: aSelector, userInfo: nil, repeats: true)
        }
    }
    
    func updateTime(){
        if counter == 0{

        }
        
        freshFishImage(counter)
        if counter % 2 == 1 {
            if sharedDate.babyWithHat {
                babyFish.image.image = UIImage(named: "f_bf_hat1")
            }else {
                babyFish.image.image = UIImage(named: "f_babyfish1")
            }
            
            if sharedDate.adultWithHat {
                if sharedDate.adultWithPipe {
                    adultFish.image.image = UIImage(named: "f_af_pipehat1")
                } else {
                    adultFish.image.image = UIImage(named: "f_af_hat1")
                }
            }else {
                if sharedDate.adultWithPipe {
                    adultFish.image.image = UIImage(named: "f_af_pipe1")

                }else{
                    adultFish.image.image = UIImage(named: "f_adultfish1")
                }
            }
            
            if sharedDate.sharkWithHat {
                if sharedDate.sharkWithPipe {
                    sharkFish.image.image = UIImage(named: "f_shark_pipehat1")
                }else {
                    sharkFish.image.image = UIImage(named: "f_shark_hat1")
                }
            }else {
                if sharedDate.sharkWithPipe {
                    sharkFish.image.image = UIImage(named: "f_shark_pipe1")
                }else {
                    sharkFish.image.image = UIImage(named: "f_shark1")
                }
            }
            
            //            sharkFish.image.image = UIImage(named: "f_shark1")
        }else {
            //            fish1.image = UIImage(named: "f_babyfish2")
        }

        counter++
    }
    
    func freshFishImage(counter: Int) {
        
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
    
    @IBAction func unwindToStore(sender: UIStoryboardSegue) {
        //        let sourceVC = sender.sourceViewController
    }
    
}

class fishImage {
    var image: UIImageView
    var length: CGFloat
    var height: CGFloat
    init(image: UIImageView, length: CGFloat, height: CGFloat){
        let yPosition : CGFloat = CGFloat(0)
        self.image = image
        self.length = length
        self.height = height
        image.frame = CGRectMake(-50, yPosition, length, height)
    }
}
