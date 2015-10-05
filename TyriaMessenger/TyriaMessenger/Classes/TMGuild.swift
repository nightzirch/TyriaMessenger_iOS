//
//  Guild.swift
//  TyriaMessenger
//
//  Created by Christian Grimsgaard on 24/09/15.
//  Copyright © 2015 ChristianGrimsgaard. All rights reserved.
//

import Foundation
import UIKit

public class TMGuild: NSObject {
    var id: String = ""
    var name: String = ""
    var tag: String = ""
    var emblem: TMGuildEmblem = TMGuildEmblem()
    
    override init() {
        super.init()
    }
    
    init(withID: String, name: String, tag: String, emblem: TMGuildEmblem) {
        super.init()
        self.name = name
        self.tag = tag
        self.emblem = emblem
    }
}