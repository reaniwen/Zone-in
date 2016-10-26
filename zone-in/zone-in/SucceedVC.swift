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
    
    var timer = Timer()
    var counter: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImage()
    }
    
    // to save time to load story board, just set the image programmatically
    func loadImage() {
        backgroundImage.image = UIImage(named: "4.background_win")
        winImage.image = UIImage(named: "4.win")
    }

    func startCounting(_ counter: Int){
        if !timer.isValid{
            let aSelector: Selector = #selector(updateTime)
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: aSelector, userInfo: nil, repeats: true)
        }
    }
    
    func updateTime(){
        if counter == 0{
            UIView.transition(with: winImage, duration: 2, options: UIViewAnimationOptions.transitionFlipFromLeft, animations: {
                self.winImage.image = self.secondImage
                }, completion: nil)
            timer.invalidate()
        }
        counter -= 1
    }
}
