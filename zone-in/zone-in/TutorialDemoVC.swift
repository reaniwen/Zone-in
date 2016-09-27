//
//  TutorialDemoVC.swift
//  zone-in
//
//  Created by Rean on 2/3/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit

class TutorialDemoVC: UIViewController {

    var timer = Timer()
    var counter = 5
    
    @IBOutlet weak var secsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Todo: Load the layer
        // Todo: Press the layer to trigger the 5s demo
        startDemo(counter)
    }
    
    
    func startDemo(_ counter: Int) {
        if !self.timer.isValid {
            let aSelector: Selector = #selector(runTimerDemo)
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: aSelector, userInfo: nil, repeats: true)
        }
    }
    
    func runTimerDemo() {
        updateTimeLabels()
        if counter <= 0{
            timer.invalidate()
            // Todo: add first fish and Jump to next viewcontroller
            self.performSegue(withIdentifier: "ToFinishDemoSegue", sender: self)
            
        }
        
        counter -= 1
    }
    
    func updateTimeLabels() {
        let seconds = counter
        
        secsLabel.text = "0" + String(seconds)
    }
    

}
