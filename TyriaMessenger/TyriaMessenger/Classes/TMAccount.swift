//
//  TMAccount.swift
//  TyriaMessenger
//
//  Created by Christian Grimsgaard on 02/10/15.
//  Copyright © 2015 ChristianGrimsgaard. All rights reserved.
//

import Foundation

class TMAccount: NSObject, NSCoding {
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
    
    required convenience init(coder aDecoder: NSCoder) {
        let id = aDecoder.decodeObjectForKey("id") as? String ?? ""
        let name = aDecoder.decodeObjectForKey("name") as? String ?? ""
        let world = aDecoder.decodeObjectForKey("world") as? Int ?? 0
        let guilds = aDecoder.decodeObjectForKey("guilds") as? [String] ?? [String]()
        let created = aDecoder.decodeObjectForKey("created") as? String ?? ""
        
        self.init(withID: id, name: name, world: world, guilds: guilds, created: created)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(id, forKey: "id")
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(world, forKey: "world")
        aCoder.encodeObject(guilds, forKey: "guilds")
        aCoder.encodeObject(created, forKey: "created")
    }
}