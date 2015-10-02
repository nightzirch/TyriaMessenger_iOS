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
    var guildName: String = ""
    var guildTag: String = ""
    var guildEmblem: UIImage = UIImage()
    
    override init() {
        super.init()
    }
    
    init(withName name: String, tag: String, emblem: UIImage) {
        super.init()
        guildName = name
        guildTag = tag
        guildEmblem = emblem
    }
}