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
    @IBOutlet weak var okBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameText.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @IBAction func setNameAct(sender: UIButton) {
        
        // Judge if the name is null
        if nameText.text == "" {
            // ToDo: use shake OK button to take place of uialert
//            let noNameAlert = UIAlertController(title: "Oops!", message: "Please type in your name!", preferredStyle: .Alert)
//            noNameAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            self.presentViewController(noNameAlert, animated: true, completion: nil)
            okBtn.shake()
        } else {
            userDefaults.setValue(nameText.text, forKey: "com.zonein.userName")
            self.performSegueWithIdentifier("setNameSegue", sender: sender)
        }
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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

extension TutorialNameVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        textField.layer.cornerRadius = 5
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = BLUE_COLOR.CGColor
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        // pretty lazy way to make it invisiable
        textField.layer.borderWidth = 0
    }
    
    // called when 'return' key pressed. return NO to ignore.
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        return true;
    }
}

extension UIView {
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.5
        animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
        layer.addAnimation(animation, forKey: "shake")
    }
    
    // another way to achieve animations
    //                        let animation = CABasicAnimation(keyPath: "position")
    //                        animation.duration = 0.07
    //                        animation.repeatCount = 4
    //                        animation.autoreverses = true
    //                        animation.fromValue = NSValue(CGPoint: CGPointMake(self.sendSMSBtn.center.x - 5, self.sendSMSBtn.center.y))
    //                        animation.toValue = NSValue(CGPoint: CGPointMake(self.sendSMSBtn.center.x + 5, self.sendSMSBtn.center.y))
    //                        self.sendSMSBtn.layer.addAnimation(animation, forKey: "position")
    
    func moveLeftRight() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 6
        animation.values = [-10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 10.0, 0]
        layer.addAnimation(animation, forKey: "move")
    }
    func moveRightLeft() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 6
        animation.values = [10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 10.0, -10.0, 0]
        layer.addAnimation(animation, forKey: "move")
    }
}
