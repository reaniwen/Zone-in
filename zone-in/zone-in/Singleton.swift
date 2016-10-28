//
//  Singleton.swift
//  zone-in
//
//  Created by Rean on 2/2/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import Foundation

class Singleton: NSObject {
    
    static let sharedInstance = Singleton()
    
    var isFailed: Bool = false
    let dateFormat = DateFormatter()
    
    override init() {
        super.init()
        dateFormat.dateFormat = "yyyy-MM-dd"
    }
}
