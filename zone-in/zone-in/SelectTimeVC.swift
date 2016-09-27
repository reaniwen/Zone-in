//
//  ViewController.swift
//  zone-in
//
//  Created by Rean on 1/31/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit

class SelectTimeVC: UIViewController {
    
    let userDefaults = UserDefaults.standard
    var time: Int = 30
    
    
    @IBOutlet weak var cloudImage: UIImageView!
    @IBOutlet weak var moreTimeBtn: UIButton!
    @IBOutlet weak var lessTimeBtn: UIButton!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImage()

    }
    
    func loadImage() {
        cloudImage.image = UIImage(named: "1.setTimerCloud")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // first launch check, if first launch, jump to tutorial
        jumpToTutorial()
    }
    
    // Todo: delete it after finish the tutorial views
    @IBAction func jumpToTutorialAct(_ sender: AnyObject) {
        jumpToTutorial()
    }
    
    func jumpToTutorial() {
        let oldUser: Bool? = userDefaults.bool(forKey: "com.zonein.oldUser")
        
        if (oldUser == nil || oldUser == false) {
            let sb = UIStoryboard(name: "Tutorial", bundle: nil)
            var vc: UIViewController?
//            if let _ = userDefaults.stringForKey("com.zonein.userName"){
//                vc = sb.instantiateViewControllerWithIdentifier("TutorialSetVC")
//            } else {
//                vc = sb.instantiateViewControllerWithIdentifier("TutorialNameVC")
//            }
            vc = sb.instantiateViewController(withIdentifier: "TutorialNameVC")
        
            if let vc = vc {
                self.present(vc, animated: true, completion: nil)
            }
        }

    }
    
    @IBAction func jumpToAquAct(_ sender: AnyObject) {
        
        let sb = UIStoryboard(name: "Aquarium", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        if let vc = vc {
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func moreTimeAct(_ sender: AnyObject) {
        if time < 60 {
            time += 10
            updateTime()
        }
    }
    
    @IBAction func lessTimeAct(_ sender: AnyObject) {
        if time > 10 {
            time -= 10
            updateTime()
        }
    }
    
    func updateTime(){
        self.timeLabel.text = String(self.time)
    }
    
    @IBAction func backToMain(_ segue: UIStoryboardSegue) {
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toMainTimerSegue" {
            if let destinationVC = segue.destination as? MainTimerVC {
                destinationVC.counter = time * 60 // 5 //
            }
        }
    }
    
    @IBAction func unwindToMain() {
        
    }
}

