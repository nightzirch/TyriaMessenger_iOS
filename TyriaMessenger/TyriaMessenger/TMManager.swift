//
//  TMManager.swift
//  TyriaMessenger
//
//  Created by Christian Grimsgaard on 24/09/15.
//  Copyright © 2015 ChristianGrimsgaard. All rights reserved.
//

import Foundation

private let TMManagerSharedInstance = TMManager()

public class TMManager: NSObject {
    public var guildList = [TMGuild]()
    
    public class var sharedInstance : TMManager {
        return TMManagerSharedInstance
    }
    
    public override init() {
        super.init()
    }
}