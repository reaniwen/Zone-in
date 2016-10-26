//
//  TutorialNameVC.swift
//  zone-in
//
//  Created by Rean on 2/3/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit

class TutorialNameVC: UIViewController {
    
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var okBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameText.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @IBAction func setNameAct(_ sender: UIButton) {
        
        // Judge if the name is null
        if nameText.text == "" {
            okBtn.shake()
        } else {
            userDefaults.setValue(nameText.text, forKey: "com.zonein.userName")
            self.performSegue(withIdentifier: "setNameSegue", sender: sender)
        }
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}

extension TutorialNameVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.layer.cornerRadius = 5
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = BLUE_COLOR.cgColor
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // pretty lazy way to make it invisiable
        textField.layer.borderWidth = 0
    }
    
    // called when 'return' key pressed. return NO to ignore.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        return true;
    }
}
