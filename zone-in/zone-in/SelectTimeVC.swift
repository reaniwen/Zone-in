//
//  ViewController.swift
//  zone-in
//
//  Created by Rean on 1/31/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit

class SelectTimeVC: UIViewController {

    var time: Int = 1
    
    @IBOutlet weak var moreTimeBtn: UIButton!
    @IBOutlet weak var lessTimeBtn: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

    }
    
    override func viewDidAppear(animated: Bool) {
        // ToDo: first launch jump, jump to tutorial
    }
    
    @IBAction func jumpToTutorialAct(sender: AnyObject) {
        let sb = UIStoryboard(name: "Tutorial", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        
        if let vc = vc {
            self.presentViewController(vc, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func moreTimeAct(sender: AnyObject) {
        if time < 60 {
            time += 10
            updateTime()
        }
    }
    
    @IBAction func lessTimeAct(sender: AnyObject) {
        if time > 10 {
            time -= 10
            updateTime()
        }
    }
    
    func updateTime(){
        self.timeLabel.text = String(self.time)
    }
    
    @IBAction func backToMain(segue: UIStoryboardSegue){
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toMainTimerSegue" {
            if let destinationVC = segue.destinationViewController as? MainTimerVC {
                destinationVC.counter = time * 60
            }
        }
    }
}

