//
//  SucceedVC.swift
//  zone-in
//
//  Created by Rean on 2/17/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit

class SucceedVC: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var winImage: UIImageView!
    
    var secondImage:UIImage = UIImage(named: "4.newItem")!
    
    var timer = NSTimer()
    var counter: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImage()
        
        startCounting(counter)
        
        // Todo add data to userdefault
        // update recent day of use
        // update longest continues days
    }
    
    func loadImage() {
        backgroundImage.image = UIImage(named: "4.background_win")
        winImage.image = UIImage(named: "4.win")
    }

    func startCounting(counter: Int){
        if !timer.valid{
            let aSelector: Selector = #selector(updateTime)
            
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
        counter -= 1
    }
}
