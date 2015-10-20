//
//  FishToolData.swift
//  Zone'in
//
//  Created by Rean on 10/19/15.
//  Copyright © 2015 Rean. All rights reserved.
//

import Foundation

class FishKind{
    var name:String = ""
    var imageString = ""
    
    init(fishName:String, imageString:String){
        self.name = fishName
        self.imageString = imageString
    }
}

class ToolKind{
    var toolName:String = ""
    var toolPrice:Int = 0
    var toolImageStr:String = ""
    
    init(toolName:String, toolPrice:Int, toolImage:String){
        self.toolName = toolName
        self.toolPrice = toolPrice
        self.toolImageStr = toolImage
    }
}