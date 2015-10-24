//
//  PageTwoViewController.swift
//  Zone'in
//
//  Created by Rean on 4/17/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class StorePageTwoViewController: UIViewController {
    var prize: Prizes = Prizes.Others

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var treasureChestImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func loadImage(){
        backgroundImage.image = UIImage(named: "10.background")
        treasureChestImage.image = UIImage(named: "10.treasureChest")
    }
    
    @IBAction func pillAct(sender: AnyObject) {
        prize = Prizes.Pill
        self.performSegueWithIdentifier("selPage2Segue", sender: self)

    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "selPage2Segue" {
            if let destinationVC = segue.destinationViewController as? ConfirmPropViewController {
                destinationVC.testText = prize.simpleDescription()
                destinationVC.prize = prize
            }
        }
    }
    
    @IBAction func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }

}
