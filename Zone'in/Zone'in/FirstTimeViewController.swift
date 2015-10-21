//
//  FirstTimeViewController.swift
//  Zone'in
//
//  Created by Rean on 10/14/15.
//  Copyright © 2015 Rean. All rights reserved.
//

import UIKit

class FirstTimeViewController: UIViewController {

    @IBOutlet weak var NameText: UITextField!
    @IBOutlet weak var promptLabel: UILabel!
    var userName: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toIntroTimerVCAct(sender: AnyObject) {
        if NameText.text == "" {
            promptLabel.text = "Oops! Please type in a name."
        }else {
            userName = NameText.text! as String
            self.performSegueWithIdentifier("IntroTimerSegue", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "IntroTimerSegue" {
            if let destinationVC = segue.destinationViewController as? IntroTimerViewController{
                destinationVC.name = NameText.text! as String
            }
        }
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
