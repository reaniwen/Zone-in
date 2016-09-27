//
//  ContentVC.swift
//  zone-in
//
//  Created by Rean on 2/18/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit

class ContentVC: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var constraintView: UIView!
    
//    var buttonTextArray:[UIButton] = []
    var buttonTextArray:[String] = []
    var pageIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonArray = [button1, button2, button3, button4]
        
        for i in 0..<buttonTextArray.count {
            let button:UIButton = buttonArray[i]!
            if let buttonTitle = buttonTextArray[i] as? String {
                button.setTitle(buttonTitle, for: UIControlState())
            }
        }
        
        self.constraintView?.backgroundColor = UIColor.clear
        self.view.backgroundColor = UIColor.clear
    }
}
