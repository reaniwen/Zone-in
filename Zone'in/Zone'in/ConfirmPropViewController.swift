//
//  ConfirmPrizeViewController.swift
//  Zone'in
//
//  Created by Rean on 4/16/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class ConfirmPropViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var prizeImage: UIImageView!
    
    var testText: String = ""
    var prize: Prizes = .Others
    
    var prizeImageSet: [UIImage] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let seaWeed:UIImage = UIImage(named: "12.1.seaweed")!
        let cleaningSet:UIImage = UIImage(named: "12.2.cleaningSet")!
        let funnyHat:UIImage = UIImage(named: "12.3.funnyHat")!
        let pipe:UIImage = UIImage(named: "12.4.pipe")!
        let pill:UIImage = UIImage(named: "12.5.pill")!
        prizeImageSet = [seaWeed, cleaningSet, funnyHat, pipe, pill]

        updateTestLabel()
        updateImage()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTestLabel(){
        testLabel.text = testText
    }
    
    func updateImage(){
        prizeImage.image = prizeImageSet[prize.rawValue]
    }
    
    @IBAction func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }
}
