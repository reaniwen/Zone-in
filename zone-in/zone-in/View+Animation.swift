//
//  View+Animation.swift
//  zone-in
//
//  Created by Rean on 10/26/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.5
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.add(animation, forKey: "shake")
        
        // another way to achieve animations
        //                        let animation = CABasicAnimation(keyPath: "position")
        //                        animation.duration = 0.07
        //                        animation.repeatCount = 4
        //                        animation.autoreverses = true
        //                        animation.fromValue = NSValue(CGPoint: CGPointMake(self.sendSMSBtn.center.x - 5, self.sendSMSBtn.center.y))
        //                        animation.toValue = NSValue(CGPoint: CGPointMake(self.sendSMSBtn.center.x + 5, self.sendSMSBtn.center.y))
        //                        self.sendSMSBtn.layer.addAnimation(animation, forKey: "position")
    }
    
    
    
    func moveLeftRight() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 6
        animation.values = [-10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 10.0, 0]
        layer.add(animation, forKey: "move")
    }
    func moveRightLeft() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 6
        animation.values = [10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 0]
        layer.add(animation, forKey: "move")
    }
    
    func showOneFish(){
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
        layer.add(anim, forKey: "animate position along path")
    }
}
