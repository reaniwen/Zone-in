//
//  TutorialNameVC.swift
//  zone-in
//
//  Created by Rean on 2/3/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit

class TutorialNameVC: UIViewController {
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var nameText: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func setNameAct(sender: UIButton) {
        
        // Judge if the name is null
        if nameText.text == "" {
            // ToDo: use shake OK button to take place of uialert
            let noNameAlert = UIAlertController(title: "Oops!", message: "Please type in your name!", preferredStyle: .Alert)
            noNameAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(noNameAlert, animated: true, completion: nil)
        } else {
            userDefaults.setValue(nameText.text, forKey: "com.zonein.userName")
            self.performSegueWithIdentifier("setNameSegue", sender: sender)
        }
    }

    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
        if segue.identifier == "setNameSegue" {
            let vc = segue.destinationViewController as! TutorialSetVC
        }
    }
    */

}
