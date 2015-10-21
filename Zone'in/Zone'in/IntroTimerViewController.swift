//
//  IntroTimerViewController.swift
//  Zone'in
//
//  Created by Rean on 10/17/15.
//  Copyright © 2015 Rean. All rights reserved.
//

import UIKit

class IntroTimerViewController: UIViewController {

    @IBOutlet weak var nameBlahLabel: UITextView!
    @IBOutlet weak var testButton: UIButton!
    var name = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateName(name)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateName(name:String){
        nameBlahLabel.text = "Ok \(name), this will be the first step, you could choose more or less time with these two buttons."
    }
    
    @IBAction func testvisible(sender: AnyObject) {
        testButton.hidden = true
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "IntroCountingSegue" {
            if let destinationVC = segue.destinationViewController as? IntroCountViewController {
                //only could change vark, not UI element
                destinationVC.counter = 20
                destinationVC.prize = Prize.Fish
                destinationVC.sharedData.isFailed = false
                destinationVC.sharedData.isLocked = false
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
