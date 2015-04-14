//
//  StoreViewController.swift
//  Zone'in
//
//  Created by Rean on 3/23/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func testFish(sender: AnyObject) {
//        // set up some constants for the animation
//        let duration : NSTimeInterval = 1.0
//        let delay : NSTimeInterval = 0.0
//        let options = UIViewAnimationOptions.CurveLinear | UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse
//        
//        // set up some constants for the fish
        let size : CGFloat = CGFloat(122)
        let yPosition : CGFloat = CGFloat(84)
//
//        // create the fish and add it to the screen
//        let fish = UIImageView()
//        fish.image = UIImage(named: "testFishWithHat")
//        fish.frame = CGRectMake(0, yPosition, size, size)
//        self.view.addSubview(fish)
//        
//        // define the animation
//        UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
//            
//            // move the fish
//            fish.frame = CGRectMake(320-size, yPosition, size, size)
//            
//            }, completion: { animationFinished in
//                
//                // remove the fish
//                fish.removeFromSuperview()
//                
//        })
        
        
        let fish1 = UIImageView()
        fish1.image = UIImage(named: "testFishWithHat")
        fish1.frame = CGRectMake(0, yPosition, size, size)
        
        // add the square to the screen
        self.view.addSubview(fish1)
        let path = UIBezierPath()
        path.moveToPoint(CGPoint(x: 16,y: 239))
        path.addCurveToPoint(CGPoint(x: 301, y: 239), controlPoint1: CGPoint(x: 136, y: 373), controlPoint2: CGPoint(x: 178, y: 110))
        
        // create a new CAKeyframeAnimation that animates the objects position
        let anim = CAKeyframeAnimation(keyPath: "position")
        
        // set the animations path to our bezier curve
        anim.path = path.CGPath
        
        // set some more parameters for the animation
        // this rotation mode means that our object will rotate so that it's parallel to whatever point it is currently on the curve
        anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = Float.infinity
        anim.duration = 5.0
        
        // we add the animation to the squares 'layer' property
        fish1.layer.addAnimation(anim, forKey: "animate position along path")
    }


}
