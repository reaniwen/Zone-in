//
//  TutorialLastVC.swift
//  zone-in
//
//  Created by Rean on 2/3/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit

class TutorialLastVC: UIViewController {
    
    let userDefaults = UserDefaults.standard

    
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var infobackGroundImage: UIImageView!
    
    @IBOutlet weak var gjLabel: UILabel!
    @IBOutlet weak var kLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var okBtn: UIButton!
    
    
    let babyFish = UIImageView(frame: CGRect(x: -50, y: 0, width: 105, height: 78))
    let adultFish = UIImageView(frame: CGRect(x: -50, y: 0, width: 149, height: 81))
    let sharkFish = UIImageView(frame: CGRect(x: -50, y: 0, width: 141, height: 92))
    
    let maskView = UIImageView()
    
    var timer = Timer()
    var counter = 0
    
    let singleton = Singleton.sharedInstance
    let pref = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = userDefaults.string(forKey: "com.zonein.userName") {
            gjLabel.text = "Good job, \(name)!"
        } else {
            gjLabel.text = "Good Job!"
        }
        
        maskView.frame = self.view.frame
        maskView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        
        infobackGroundImage.layer.cornerRadius = 20
        
        loadImage()
        
        view.addSubview(babyFish)
        view.addSubview(adultFish)
        view.addSubview(sharkFish)
        view.addSubview(maskView)
        
        // Todo: find a way to sort the view
        view.bringSubview(toFront: infobackGroundImage)
        view.bringSubview(toFront: gjLabel)
        view.bringSubview(toFront: kLabel)
        view.bringSubview(toFront: aLabel)
        view.bringSubview(toFront: okBtn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        babyFish.showOneFish()
        adultFish.showOneFish()
        sharkFish.showOneFish()
    }    
    
    // to save time to load story board, just set the image programmatically
    func loadImage() {
        backgroundImage.image = UIImage(named: "cleanAquarium")
        babyFish.image = UIImage(named: "f_babyfish1")
        adultFish.image = UIImage(named: "f_adultfish1")
        sharkFish.image = UIImage(named: "f_shark1")
    }

    @IBAction func finishAct(_ sender: AnyObject) {
        print("demo timer finished")
        UserDefaults.standard.set(true, forKey: "com.zonein.oldUser")
    }
    
    
}
