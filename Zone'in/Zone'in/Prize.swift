//
//  Prize.swift
//  Zone'in
//
//  Created by Rean on 4/16/15.
//  Copyright (c) 2015 Rean. All rights reserved.
//

import Foundation

enum Prizes: Int {
    case Seaweed = 0
    case CleaningSet, FunnyHat, Pipe, Pill, Others
    
    func simpleDescription() -> String {
        switch self{
        case .Seaweed: return "Seaweed"
        case .CleaningSet: return "CleaningSet"
        case .FunnyHat: return "FunnyHat"
        case .Pipe: return "Pipe"
        case .Pill: return "Pill"
        case .Others: return "Others"
        }
    }
}

