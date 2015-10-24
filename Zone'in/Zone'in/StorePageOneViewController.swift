//
//  Page1ViewController.swift
//  Zone'in
//
//  Created by Rean on 4/16/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class StorePageOneViewController: UIViewController {
    var prize: Prizes = Prizes.Others
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var treasureChestImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        loadImage()
        // Do any additional setup after loading the view.
    }
    
    func loadImage(){
        backgroundImage.image = UIImage(named: "10.background")
        treasureChestImage.image = UIImage(named: "10.treasureChest")
    }
    
    @IBAction func seaweedAct(sender: AnyObject) {
        prize = Prizes.Seaweed
        self.performSegueWithIdentifier("selPage1Segue", sender: self)
    }
    @IBAction func cleaningSetAct(sender: AnyObject) {
        prize = Prizes.CleaningSet
        self.performSegueWithIdentifier("selPage1Segue", sender: self)
    }
    @IBAction func funnyCatAct(sender: AnyObject) {
        prize = Prizes.FunnyHat
        self.performSegueWithIdentifier("selPage1Segue", sender: self)
    }
    @IBAction func pipeAct(sender: AnyObject) {
        prize = Prizes.Pipe
        self.performSegueWithIdentifier("selPage1Segue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "selPage1Segue" {
            if let destinationVC = segue.destinationViewController as? ConfirmPropViewController {
                destinationVC.testText = prize.simpleDescription()
                destinationVC.prize = prize
            }
        }
    }

}
