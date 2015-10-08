//
//  Guild.swift
//  TyriaMessenger
//
//  Created by Christian Grimsgaard on 24/09/15.
//  Copyright © 2015 ChristianGrimsgaard. All rights reserved.
//

import Foundation
import UIKit

class TMGuild: NSObject, NSCoding {
    var id: String = ""
    var name: String = ""
    var tag: String = ""
    var emblem: TMGuildEmblem = TMGuildEmblem()
    var emblemData: NSData = NSData()
    
    override init() {
        super.init()
    }
    
    init(withID id: String, name: String, tag: String, emblem: TMGuildEmblem, emblemData: NSData) {
        super.init()
        self.id = id
        self.name = name
        self.tag = tag
        self.emblem = emblem
        self.emblemData = emblemData
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObjectForKey("id") as? String ?? ""
        let name = aDecoder.decodeObjectForKey("name") as? String ?? ""
        let tag = aDecoder.decodeObjectForKey("tag") as? String ?? ""
        let emblem = aDecoder.decodeObjectForKey("emblem") as? TMGuildEmblem ?? TMGuildEmblem()
        let emblemData = aDecoder.decodeObjectForKey("emblemData") as? NSData ?? NSData()
        
        
        self.init(withID: id, name: name, tag: tag, emblem: emblem, emblemData: emblemData)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(tag, forKey: "world")
        aCoder.encodeObject(emblem, forKey: "guilds")
        aCoder.encodeObject(emblemData, forKey: "emblemData")
    }
}