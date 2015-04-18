//
//  WinViewController.swift
//  Zone'in
//
//  Created by Rean on 4/18/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class WinViewController: UIViewController {
    @IBOutlet weak var winImage: UIImageView!
    
    var secondImage:UIImage = UIImage(named: "7.newItemInAquarium")!
    
    var timer = NSTimer()
    var counter: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startCounting(counter)
    }

    func startCounting(counter: Int){
        if !timer.valid{
            let aSelector: Selector = "updateTime"
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: aSelector, userInfo: nil, repeats: true)
        }
    }
    
    func updateTime(){
        if counter == 0{
            UIView.transitionWithView(winImage, duration: 2, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations: {
                self.winImage.image = self.secondImage
                }, completion: nil)
            timer.invalidate()
        }
        counter--
    }


    
    
}
