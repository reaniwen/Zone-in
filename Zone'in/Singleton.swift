//
//  Singleton.swift
//  Zone'in
//
//  Created by Rean on 3/6/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import Foundation

@objc(Singleton)
class Singleton {
    
    var lockState: Int = 0
    
    //    var player:Player = Player(name:"Tom")
    
    class var sharedInstance: Singleton {
        struct Static {
            static let instance: Singleton = Singleton()
        }
        return Static.instance
    }
    
}