//
//  IntroCountingViewController.swift
//  Zone'in
//
//  Created by Rean on 10/17/15.
//  Copyright © 2015 Rean. All rights reserved.
//

import UIKit

class IntroCountViewController: UIViewController {
    
    @IBOutlet weak var minsLabel: UILabel!
    @IBOutlet weak var secsLabel: UILabel!
    @IBOutlet weak var tankImage: UIImageView!
    @IBOutlet weak var waterImage: UIImageView!
    @IBOutlet weak var fishImage: UIImageView!
    @IBOutlet weak var seaweedImage: UIImageView!
    
    var timer = NSTimer()
    var counter: Int = 20
    var estCounter: Int = 0
    let sharedData: Singleton = Singleton.sharedInstance
    var prize: Prize = .Fish
    

    override func viewDidLoad() {
        super.viewDidLoad()
        estCounter = counter / 20
        startCounting(counter)
        updateTankImage(0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
//            self.performSegueWithIdentifier("SucceedSegue", sender: self)
            timer.invalidate()
            self.performSegueWithIdentifier("FinishCountSegue", sender: self)
        }
//
//        if sharedData.isFailed == true{
//            //failed
//            self.performSegueWithIdentifier("LoseSegue", sender: self)
//            timer.invalidate()
//        }
        if prize == .Fish {
            fishImage.hidden = false
            seaweedImage.hidden = true
            if counter % 2 == 1 {
                fishImage.image = UIImage(named: "f_babyfish1")?.imageRotatedByDegrees(20, flip: false)
                //            rotatedPhoto = rotatedPhoto?.imageRotatedByDegrees(90, flip: false)
            }else {
                fishImage.image = UIImage(named: "f_babyfish2")?.imageRotatedByDegrees(20, flip: false)
            }
        }else if prize == .Seaweed {
            fishImage.hidden = true
            seaweedImage.hidden = false
            seaweedImage.image = UIImage(named: "3.magicSeaweed")
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


