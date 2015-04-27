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
    
    @IBAction func toUseOneViewController(segue:UIStoryboardSegue) {
        
    }

    @IBAction func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }

}
