//
//  QuitViewController.swift
//  Zone'in
//
//  Created by Rean on 4/6/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import UIKit

class QuitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func close(){
        dismissViewControllerAnimated(true, completion: nil)
    }

}
