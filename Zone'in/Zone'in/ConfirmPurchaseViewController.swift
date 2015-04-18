//
//  ConfirmPurchaseViewController.swift
//  Zone'in
//
//  Created by Rean on 4/17/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class ConfirmPurchaseViewController: UIViewController {
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var prizeImage: UIImageView!
    
    var testText: String = ""
    var prize: Prizes = .Others
    
    var prizeImageSet: [UIImage] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let seaWeed:UIImage = UIImage()
        let cleaningSet:UIImage = UIImage(named: "23.1cleaningSet2")!
        let funnyHat:UIImage = UIImage(named: "23.3funnyHat2")!
        let pipe:UIImage = UIImage(named: "23.4pipe2")!
        let pill:UIImage = UIImage(named: "23.2pill2")!
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
