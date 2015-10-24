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
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var testText: String = ""
    var prize: Prizes = .Others
    
    var prizeImageSet: [UIImage] = []
    var labelSet:[String] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadImage()
        
        let seaWeed:UIImage = UIImage(named: "12.1.seaweed")!
        let cleaningSet:UIImage = UIImage(named: "12.2.cleaningSet")!
        let funnyHat:UIImage = UIImage(named: "12.3.funnyHat")!
        let pipe:UIImage = UIImage(named: "12.4.pipe")!
        let pill:UIImage = UIImage(named: "12.5.pill")!
        prizeImageSet = [seaWeed, cleaningSet, funnyHat, pipe, pill]
        labelSet = ["", "To clean", "Funny Hat", "Pipe", "Make fish grow"]

//        updateTestLabel()
        updateImageAndLabel()
        // Do any additional setup after loading the view.
    }

    func loadImage(){
        backgroundImage.image = UIImage(named: "10.background")
    }
    
    func updateTestLabel(){
        testLabel.text = testText
    }
    
    func updateImageAndLabel(){
        prizeImage.image = prizeImageSet[prize.rawValue]
        testLabel.text = labelSet[prize.rawValue]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GotoSelFishSegue" {
            if let destinationVC = segue.destinationViewController as? ChooseFishViewController {
//                destinationVC.testText = prize.simpleDescription()
                destinationVC.prize = prize
            }
        }
    }
    
    @IBAction func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }
}
