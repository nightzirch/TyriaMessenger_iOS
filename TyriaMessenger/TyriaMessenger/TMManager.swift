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
    public var account = TMAccount()
    public var guildList = [String]()
    
    public class var sharedInstance : TMManager {
        return TMManagerSharedInstance
    }
    
    func updateData() {
//        let APIToken = "26509F8B-4F0D-FD4F-8762-2722633813D6C467BEA8-46C4-4835-BA9E-F9EECC7FF7B4"
        
    }
    
    public override init() {
        super.init()
        updateData()
    }
}