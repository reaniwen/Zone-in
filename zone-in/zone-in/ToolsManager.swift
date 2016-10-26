//
//  ToolsManager.swift
//  zone-in
//
//  Created by Rean on 2/17/16.
//  Copyright © 2016 Rean. All rights reserved.
//

import Foundation
class ToolsManager {
    var tools: [Tool] = []
}

class Tool: NSObject {
    var name: String?
    init(name: String?) {
        self.name = name
    }
}
