//
//  MainTimerVC.swift
//  zone-in
//
//  Created by Rean on 1/31/16.
//  Copyright © 2016 Rean. All rights reserved.
//

// ToDo: Terminate Timer when jump to other page

import UIKit

class MainTimerVC: UIViewController {
    
    var timer = NSTimer()
    var counter = 30 * 60
    let estCounter = 0
    
    @IBOutlet weak var timeDemoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        startCounting(counter)
    }
    
    func startCounting(counter: Int) {
        if !self.timer.valid {
            let aSelector: Selector = "updateTime"
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: aSelector, userInfo: nil, repeats: true)
        }
    }
    
    func updateTime() {
        // Todo: update time labels
        timeDemoLabel.text = String(self.counter)
        
        NSLog(String(self.counter))
        self.counter--
    }
    
    // Back from hesitating
    @IBAction func backToTimer(segue:UIStoryboardSegue){
    }
    
    // Use unwind segue to terminate timer and unwind back to selectTimerVC
    @IBAction func backToTerminateTimer(segue: UIStoryboardSegue) {
        self.timer.invalidate()
        self.dismissViewControllerAnimated(false, completion: nil)
    }

    
/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "backToMainSegue" {
            if let selectTimeVC = segue.destinationViewController as? SelectTimeVC {
                selectTimeVC.time = 60
                selectTimeVC.updateTime()
                print("Oops")
            }
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
*/


}
