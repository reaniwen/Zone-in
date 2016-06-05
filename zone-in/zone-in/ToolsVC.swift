//
//  ToolsVC.swift
//  zone-in
//
//  Created by Rean on 2/17/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import UIKit

class ToolsVC: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadImage()
    }
    
    func loadImage() {
        backgroundImage.image = UIImage(named: "storeBackground")
    }

}
