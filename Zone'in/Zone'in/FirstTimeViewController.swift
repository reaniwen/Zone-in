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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func testSegue(sender: AnyObject) {
//        self.performSegueWithIdentifier("totimerSegue", sender: self)
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
