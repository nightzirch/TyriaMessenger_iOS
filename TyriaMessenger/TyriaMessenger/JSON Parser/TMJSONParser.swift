//
//  TMJSONParser.swift
//  TyriaMessenger
//
//  Created by Christian Grimsgaard on 02/10/15.
//  Copyright © 2015 ChristianGrimsgaard. All rights reserved.
//

import Foundation
import SwiftyJSON

class TMJSONParser {
    class func parseAccount(json: JSON) -> TMAccount {
        let id = json["id"].stringValue
        let name = json["name"].stringValue
        let world = json["world"].intValue
        let created = json["created"].stringValue
        var guilds = [String]()
        
        for (_, guild):(String, JSON) in json["guilds"] {
            guilds.append(guild.stringValue)
        }
        
        let account = TMAccount.init(withID: id, name: name, world: world, guilds: guilds, created: created)
        
        return account
    }
    
    class func parseGuild(json: JSON) -> TMGuild {
        let id = json["guild_id"].stringValue
        let name = json["guild_name"].stringValue
        let tag = "[" + json["tag"].stringValue + "]"
        let emblemData = NSData(data: UIImagePNGRepresentation(UIImage(named: "Guild Emblem")!)!)
        
        let foregroundID = json["emblem"]["foreground_id"].intValue
        let foregroundPrimaryColorID = json["emblem"]["foreground_primary_color_id"].intValue
        let foregroundSecondaryColorID = json["emblem"]["foreground_secondary_color_id"].intValue
        let backgroundID = json["emblem"]["background_id"].intValue
        let backgroundColorID = json["emblem"]["background_color_id"].intValue
        var flags = [String]()
        
        for (_, flag):(String, JSON) in json["emblem"]["flags"] {
            flags.append(flag.stringValue)
        }
        
        let emblem = TMGuildEmblem.init(withBackgroundID: backgroundID, backgroundColorID: backgroundColorID, foregroundID: foregroundID, foregroundPrimaryColorID: foregroundPrimaryColorID, foregroundSecondaryColorID: foregroundSecondaryColorID, flags: flags)
        let guild = TMGuild.init(withID: id, name: name, tag: tag, emblem: emblem, emblemData: emblemData)
        
        return guild
    }
}