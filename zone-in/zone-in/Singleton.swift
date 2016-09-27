//
//  Singleton.swift
//  zone-in
//
//  Created by Rean on 2/2/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import Foundation

class Singleton: NSObject {
    
    var isFailed: Bool = false
    
    let dateFormat = DateFormatter()
    
    class var sharedInstance: Singleton {
        struct Static {
            static let instance: Singleton = Singleton()
        }
        return Static.instance
    }
    
    override init() {
        super.init()
        dateFormat.dateFormat = "yyyy-MM-dd"
    }
}
