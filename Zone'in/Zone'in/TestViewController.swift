//
//  TestViewController.swift
//  Zone'in
//
//  Created by Rean on 4/13/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let coloredSquare = UIView()
        coloredSquare.backgroundColor = UIColor.blueColor()
        
        coloredSquare.frame = CGRect(x: 0, y: 120, width: 50, height: 50)
        
        UIView.animateWithDuration(1.0, animations: {
            coloredSquare.backgroundColor = UIColor.redColor()
            coloredSquare.frame = CGRect(x: 320-50, y: 120, width: 50, height: 50)
        })
        
        self.view.addSubview(coloredSquare)
    }


}
