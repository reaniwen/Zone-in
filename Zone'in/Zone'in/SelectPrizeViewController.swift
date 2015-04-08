//
//  SelectPrizeViewController.swift
//  Zone'in
//
//  Created by Rean on 3/27/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class SelectPrizeViewController: UIViewController {
    
    let sharedData:Singleton = Singleton.sharedInstance
    
    @IBOutlet weak var fishBtn: UIButton!
    @IBOutlet weak var seaweedBtn: UIButton!
    
    var prize: Prize = .Fish
    
    
    //this two var is only used for test prepareForSugue
    @IBOutlet weak var testLabel: UILabel!
//    var testText: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


//        updateTestLabel(testText)
        testLabel.hidden = true
        
    }
    
    
    @IBAction func selectFish(sender: AnyObject) {
        let image1 = UIImage(named: "2.fishSelected")
        let image2 = UIImage(named: "2.seaweedIcon")
        fishBtn.setImage(image1, forState: .Normal)
        seaweedBtn.setImage(image2, forState: .Normal)
        testLabel.text = "You select Fish"
        testLabel.hidden = false
        prize = Prize.Fish
    }
    
    @IBAction func selectSeaweed(sender: AnyObject) {
        let image1 = UIImage(named: "2.fishIcon")
        let image2 = UIImage(named: "2.seaweedSelected")
        fishBtn.setImage(image1, forState: .Normal)
        seaweedBtn.setImage(image2, forState: .Normal)
        testLabel.text = "You select Seaweed"
        testLabel.hidden = false
        prize = Prize.Seaweed
    }
    
    
    @IBAction func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "StartTimerSegue" {
            if let destinationVC = segue.destinationViewController as? TimerViewController {
                        //only could change vark, not UI element
                    destinationVC.counter = sharedData.time * 60
                    destinationVC.prize = prize
                    destinationVC.sharedData.isFailed = false
                    destinationVC.sharedData.isLocked = false
            }
        }
    }
    
    
//    func updateTestLabel(text: String) {
//        testLabel.text = text
//    }
}

enum Prize{
    case Fish
    case Seaweed
}