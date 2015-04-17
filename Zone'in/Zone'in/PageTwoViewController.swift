//
//  PageTwoViewController.swift
//  Zone'in
//
//  Created by Rean on 4/17/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class PageTwoViewController: UIViewController {
    var prize: Prizes = Prizes.Others

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func pillAct(sender: AnyObject) {
        prize = Prizes.Pill
        self.performSegueWithIdentifier("selPage2Segue", sender: self)

    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "selPage2Segue" {
            if let destinationVC = segue.destinationViewController as? ConfirmPrizeViewController {
                destinationVC.testText = prize.simpleDescription()
                destinationVC.prize = prize
            }
        }
    }
    
    @IBAction func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }

}
