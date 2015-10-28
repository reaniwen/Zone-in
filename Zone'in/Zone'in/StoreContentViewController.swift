//
//  StoreContentViewController.swift
//  Zone'in
//
//  Created by Rean on 10/27/15.
//  Copyright © 2015 Rean. All rights reserved.
//

import UIKit

class StoreContentViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var constraintView: UIView!
    
    var buttonTextArray = []
    var pageIndex: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonArray = [button1, button2, button3, button4]
        
        for i in 0...buttonTextArray.count - 1 {
            let button:UIButton = buttonArray[i]
            if let buttonTitle = buttonTextArray[i] as? String {
                button.setTitle(buttonTitle, forState: .Normal)
            }
        }
        
        self.constraintView.backgroundColor = UIColor.clearColor()
        self.view.backgroundColor = UIColor.clearColor()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
