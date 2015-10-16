//
//  BuyOneViewController.swift
//  Zone'in
//
//  Created by Rean on 4/17/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class BuyOneViewController: UIViewController {
    
    var prize: Prizes = .Others
    var money = 0
    @IBOutlet weak var moneyLabel: UILabel!

    
    override func viewDidAppear(animated: Bool) {
        //refresh money
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func seaweedAct(sender: AnyObject) {
        prize = Prizes.Seaweed
        self.performSegueWithIdentifier("buyPage1Segue", sender: self)
    }
    @IBAction func cleaningSetAct(sender: AnyObject) {
        prize = Prizes.CleaningSet
        self.performSegueWithIdentifier("buyPage1Segue", sender: self)
    }
    @IBAction func funnyCatAct(sender: AnyObject) {
        prize = Prizes.FunnyHat
        self.performSegueWithIdentifier("buyPage1Segue", sender: self)
    }
    @IBAction func pipeAct(sender: AnyObject) {
        prize = Prizes.Pipe
        self.performSegueWithIdentifier("buyPage1Segue", sender: self)
    }
    @IBAction func pillAct(sender: AnyObject) {
        prize = Prizes.Pill
        self.performSegueWithIdentifier("buyPage1Segue", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "buyPage1Segue" {
            if let destinationVC = segue.destinationViewController as? ConfirmPurchaseViewController {
                destinationVC.testText = prize.simpleDescription()
                destinationVC.prize = prize
            }
        }
    }
    
    @IBAction func toBuyOneViewController(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }

}
