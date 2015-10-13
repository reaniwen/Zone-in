//
//  CheckFirstLoginViewController.swift
//  Zone'in
//
//  Created by Rean on 10/12/15.
//  Copyright © 2015 Rean. All rights reserved.
//

import UIKit

class CheckFirstLoginViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        warningLabel.text = ""
        if((NSUserDefaults.standardUserDefaults().boolForKey("isFirstLaunch")as Bool!) != false){
//            testLabel.text = "first"
            //jump to the time selecter view
            //jumpToTimer()
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func takeTutorialAct(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(true, forKey: "isFirstLaunch")
        NSUserDefaults.standardUserDefaults().setObject(nameLabel.text, forKey: "userNameKey")
        //jump to time selector demo and 20s demo
        //then get the first prize
    }
    
    func jumpToTimer(){
    
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
