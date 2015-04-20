//
//  ChooseFishViewController.swift
//  Zone'in
//
//  Created by Rean on 4/19/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class ChooseFishViewController: UIViewController {
    var prize : Prizes = .Others
    var fish: FishClass = .Others
    
    let sharedData:Singleton = Singleton.sharedInstance
    
    @IBOutlet weak var babyfishBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if prize == .Pipe {
            babyfishBtn.setImage(UIImage(named: "18.1.babyFish2"), forState: .Normal)
            babyfishBtn.enabled = false

        }else {
            babyfishBtn.setImage(UIImage(named: "18.1.babyFish"), forState: .Normal)
            babyfishBtn.enabled = true
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func babyFishAct(sender: AnyObject) {
        fish = FishClass.BabyFish
        if prize == .FunnyHat {
            sharedData.babyWithHat = true
            self.performSegueWithIdentifier("ConfirmUseSegue", sender: self)
        }
    }
    
    @IBAction func adultFishAct(sender: AnyObject) {
        fish = FishClass.AdultFish
        if prize == .FunnyHat {
            sharedData.adultWithHat = true
            self.performSegueWithIdentifier("ConfirmUseSegue", sender: self)
        }else if prize == .Pipe {
            sharedData.adultWithPipe = true
            self.performSegueWithIdentifier("ConfirmUseSegue", sender: self)
        }
    }
    
    @IBAction func sharkAct(sender: AnyObject) {
        fish = FishClass.Shark
        if prize == .FunnyHat {
            sharedData.sharkWithHat = true
            self.performSegueWithIdentifier("ConfirmUseSegue", sender: self)
        }else if prize == .Pipe {
            sharedData.sharkWithPipe = true
            self.performSegueWithIdentifier("ConfirmUseSegue", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ConfirmUseSegue" {
            if let destinationVC = segue.destinationViewController as? ConFishViewController {

                destinationVC.fish = fish
            }
        }
    }
    
    @IBAction func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }
}

