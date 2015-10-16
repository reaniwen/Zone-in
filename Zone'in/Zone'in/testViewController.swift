//
//  testViewController.swift
//  Zone'in
//
//  Created by Rean on 4/18/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class testViewController: UIViewController {

    @IBOutlet weak var testImageView: UIImageView!
    @IBOutlet weak var testLabel: UILabel!
    
    var timer = NSTimer()
    var counter:Int = 1
    
    var secondImage: UIImage = UIImage(named: "7.newItemInAquarium")!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startCounting(counter)
        
    }


    
    func startCounting(counter: Int){
        if !timer.valid{
            let aSelector: Selector = "updateTime"
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: aSelector, userInfo: nil, repeats: true)
        }
    }
    
    func updateTime(){
        updateLabel()
        if counter == 0{
            UIView.transitionWithView(testImageView, duration: 2, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations: {
                self.testImageView.image = self.secondImage
                }, completion: nil)
            timer.invalidate()
        }
        counter--
    }
    func updateLabel(){
        testLabel.text = "\(counter)"
    }
    
    @IBAction func testAnimationAct(sender: AnyObject) {
        UIView.transitionWithView(testImageView, duration: 2, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations: {
            self.testImageView.image = self.secondImage
            }, completion: nil)
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
