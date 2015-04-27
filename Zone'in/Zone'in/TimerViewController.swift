//
//  TimerViewController.swift
//  Zone'in
//
//  Created by Rean on 3/27/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var minsLabel: UILabel!
    @IBOutlet weak var secsLabel: UILabel!
    @IBOutlet weak var tankImage: UIImageView!
    @IBOutlet weak var waterImage: UIImageView!
    @IBOutlet weak var fishImage: UIImageView!
    @IBOutlet weak var seaWeedImage: UIImageView!
    
//    var minsVal: Int = 0
//    var secsVal: Int = 0
    var timer = NSTimer()
    var counter: Int = 0
    var estCounter: Int = 0
    let sharedData: Singleton = Singleton.sharedInstance
    var prize: Prize = .Fish
    
    override func viewDidLoad() {
        super.viewDidLoad()
        estCounter = counter / 20
        startCounting(counter)
        updateTankImage(0)
//        var image = UIImage(named: "3.1")
//        fishTankImage.image = image
    }
    
    func startCounting(counter: Int){
        if !timer.valid{
            let aSelector: Selector = "updateTime"
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: aSelector, userInfo: nil, repeats: true)
        }
    }
    
    func updateTime(){
        
        let minutes = Int(counter / 60)
        
        //        elapsedTime -= (NSTimeInterval(minutes)*60)
        
        let seconds = counter - minutes * 60
        
        var strMinutes = "00"
        if minutes > 9 {
            strMinutes = String(minutes)
        }else{
            strMinutes = "0" + String(minutes)
        }
        
        var strSeconds = "00"
        if seconds > 9 {
            strSeconds = String(seconds)
        }else{
            strSeconds = "0" + String(seconds)
        }
        
        updateLabel(strMinutes, secs: strSeconds)
//        countingLabel.text = "\(strMinutes):\(strSeconds)"
        
        
        
        if counter == 0{
            //success
            self.performSegueWithIdentifier("SucceedSegue", sender: self)
        }
        
        if sharedData.isFailed == true{
            //failed
            self.performSegueWithIdentifier("LoseSegue", sender: self)
            timer.invalidate()
        }
        if prize == .Fish {
            fishImage.hidden = false
            seaWeedImage.hidden = true
            if counter % 2 == 1 {
                fishImage.image = UIImage(named: "f_babyfish1")?.imageRotatedByDegrees(20, flip: false)
                //            rotatedPhoto = rotatedPhoto?.imageRotatedByDegrees(90, flip: false)
            }else {
                fishImage.image = UIImage(named: "f_babyfish2")?.imageRotatedByDegrees(20, flip: false)
            }
        }else if prize == .Seaweed {
            fishImage.hidden = true
            seaWeedImage.hidden = false
            seaWeedImage.image = UIImage(named: "3.magicSeaweed")
        }
        
        
        if counter <= estCounter {
            updateTankImage(22)
        }else if counter <= estCounter * 2 {
            updateTankImage(21)
        }else if counter <= estCounter * 3 {
            updateTankImage(20)
        }else if counter <= estCounter * 4 {
            updateTankImage(19)
        }else if counter <= estCounter * 5 {
            updateTankImage(17)
        }else if counter <= estCounter * 6 {
            updateTankImage(16)
        }else if counter <= estCounter * 7 {
            updateTankImage(15)
        }else if counter <= estCounter * 8 {
            updateTankImage(13)
        }else if counter <= estCounter * 9 {
            updateTankImage(12)
        }else if counter <= estCounter * 10 {
            updateTankImage(11)
        }else if counter <= estCounter * 11 {
            updateTankImage(10)
        }else if counter <= estCounter * 12 {
            updateTankImage(9)
        }else if counter <= estCounter * 13 {
            updateTankImage(7)
        }else if counter <= estCounter * 14 {
            updateTankImage(6)
        }else if counter <= estCounter * 15 {
            updateTankImage(5)
        }else if counter <= estCounter * 16 {
            updateTankImage(4)
        }else if counter <= estCounter * 17 {
            updateTankImage(3)
        }else if counter <= estCounter * 18 {
            updateTankImage(2)
        }else if counter <= estCounter * 19 {
            updateTankImage(1)
        }else {
            updateTankImage(0)
        }
        
        counter--
    }
    
    func updateLabel(mins: String, secs: String) {
        minsLabel.text = mins
        secsLabel.text = secs
    }
    
    func updateTankImage(currNum: Int) {
        let currTankImage: UIImage = UIImage(named: "3.fishtank\(currNum)")!
        let currWaterImage: UIImage = UIImage(named: "3.water\(currNum)")!
        tankImage.image = currTankImage
        waterImage.image = currWaterImage
    }

}

class CountTankImage {
    var tankImage: UIImage
    var waterImage: UIImage
    init(tankImage: UIImage, waterImage: UIImage){
        self.tankImage = tankImage
        self.waterImage = waterImage
    }
}

extension UIImage {
    public func imageRotatedByDegrees(degrees: CGFloat, flip: Bool) -> UIImage {
        let radiansToDegrees: (CGFloat) -> CGFloat = {
            return $0 * (180.0 / CGFloat(M_PI))
        }
        let degreesToRadians: (CGFloat) -> CGFloat = {
            return $0 / 180.0 * CGFloat(M_PI)
        }
        
        // calculate the size of the rotated view's containing box for our drawing space
        let rotatedViewBox = UIView(frame: CGRect(origin: CGPointZero, size: size))
        let t = CGAffineTransformMakeRotation(degreesToRadians(degrees));
        rotatedViewBox.transform = t
        let rotatedSize = rotatedViewBox.frame.size
        
        // Create the bitmap context
        UIGraphicsBeginImageContext(rotatedSize)
        let bitmap = UIGraphicsGetCurrentContext()
        
        // Move the origin to the middle of the image so we will rotate and scale around the center.
        CGContextTranslateCTM(bitmap, rotatedSize.width / 2.0, rotatedSize.height / 2.0);
        
        //   // Rotate the image context
        CGContextRotateCTM(bitmap, degreesToRadians(degrees));
        
        // Now, draw the rotated/scaled image into the context
        var yFlip: CGFloat
        
        if(flip){
            yFlip = CGFloat(-1.0)
        } else {
            yFlip = CGFloat(1.0)
        }
        
        CGContextScaleCTM(bitmap, yFlip, -1.0)
        CGContextDrawImage(bitmap, CGRectMake(-size.width / 2, -size.height / 2, size.width, size.height), CGImage)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
