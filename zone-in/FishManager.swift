//
//  FishManager.swift
//  zone-in
//
//  Created by Rean on 2/17/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import Foundation
import UIKit

class FishManager {
    var fishs: [Fish] = []
}

class Fish: NSObject {
    var name: String?
    var image: UIImage?
    init(name: String?, image: UIImage?) {
        self.name = name
        self.image = image
    }
}