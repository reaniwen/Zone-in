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
    
    var isLocked: Bool = false
    var isFailed: Bool = false
    
    var time: Int = 0
    
    var babyWithHat: Bool = false
    var adultWithHat: Bool = false
    var adultWithPipe: Bool = false
    var sharkWithHat: Bool = false
    var sharkWithPipe: Bool = false
    
    
    class var sharedInstance: Singleton {
        struct Static {
            static let instance: Singleton = Singleton()
        }
        return Static.instance
    }
    
    func updateLockStatus(state: Bool){
        isLocked = state
    }
    
    
}