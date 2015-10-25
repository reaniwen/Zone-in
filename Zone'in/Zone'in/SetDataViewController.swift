//
//  SetDataViewController.swift
//  Zone'in
//
//  Created by Rean on 10/15/15.
//  Copyright © 2015 Rean. All rights reserved.
//

import UIKit

class SetDataViewController: UIViewController {
    
    var userName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDefaultData()

        // Do any additional setup after loading the view.
    }
    
    func setDefaultData(){
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setBool(true, forKey: "IsFirstLaunch")
        defaults.setObject(userName, forKey: "userName")
        defaults.setInteger(10, forKey: "moneyContained")
        defaults.synchronize()
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
