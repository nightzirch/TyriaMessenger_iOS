//
//  TMAccount.swift
//  TyriaMessenger
//
//  Created by Christian Grimsgaard on 02/10/15.
//  Copyright © 2015 ChristianGrimsgaard. All rights reserved.
//

import Foundation
import UIKit

public class TMAccount: NSObject {
    var id: String = ""
    var name: String = ""
    var world: Int = 0
    var guilds: Array = [String]()
    var created: String = ""
    
    override init() {
        super.init()
    }
    
    init(withID id: String, name: String, world: Int, guilds: [String], created: String) {
        super.init()
        self.id = id
        self.name = name
        self.world = world
        self.guilds = guilds
        self.created = created
    }
}