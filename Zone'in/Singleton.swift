//
//  Singleton.swift
//  Zone'in
//
//  Created by Rean on 3/6/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import Foundation

@objc(Singleton)
class Singleton: NSObject {
    
    var lockState: Int = 0
    
    class var sharedInstance: Singleton {
        struct Static {
            static let instance: Singleton = Singleton()
        }
        return Static.instance
    }
    
}