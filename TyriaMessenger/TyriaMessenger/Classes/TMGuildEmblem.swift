//
//  TMGuildEmblem.swift
//  TyriaMessenger
//
//  Created by Christian Grimsgaard on 02/10/15.
//  Copyright © 2015 ChristianGrimsgaard. All rights reserved.
//

import Foundation
public class TMGuildEmblem: NSObject {
    var backgroundID: Int = 0
    var foregroundID: Int = 0
    var flags: Array = [String]()
    var backgroundColorID: Int = 0
    var foregroundPrimaryColorID: Int = 0
    var foregroundSecondaryColorID: Int = 0
    
    override init() {
        super.init()
    }
    
    init(withBackgroundID backgroundID: Int, foregroundID: Int, flags: [String], backgroundColorID: Int, foregroundPrimaryColorID: Int, foregroundSecondaryColorID: Int) {
        super.init()
        self.backgroundID = backgroundID
        self.foregroundID = foregroundID
        self.flags = flags
        self.backgroundColorID = backgroundColorID
        self.foregroundPrimaryColorID = foregroundPrimaryColorID
        self.foregroundSecondaryColorID = foregroundSecondaryColorID
    }
}