//
//  TMJSONParser.swift
//  TyriaMessenger
//
//  Created by Christian Grimsgaard on 02/10/15.
//  Copyright © 2015 ChristianGrimsgaard. All rights reserved.
//

import Foundation

class TMJSONParser {
    
    
//    class func getAccountData(gotAccountCallback: (TMAccount) -> ()) {
//        TMDataManager.getAPIDataFromURLWithSuccess(TM_GW2API_ACCOUNT_URL, success: {(data) -> Void in
//            let parsedObject: AnyObject?
//            
//            do {
//                parsedObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
//            } catch _ {
//                parsedObject = nil
//            }
//            
//            guard let parsedAccount = parsedObject as? NSDictionary,
//                  let id = parsedAccount["id"] as? String,
//                  let name = parsedAccount["name"] as? String,
//                  let world = parsedAccount["world"] as? Int,
//                  let guilds = parsedAccount["guilds"] as? NSArray,
//                  let created = parsedAccount["created"] as? String else {return}
//            
//            // Fetch data for each guild in account.guilds
//            var guildsArr: Array = [TMGuild]()
//            
//            let account = TMAccount.init(withID: id, name: name, world: world, guilds: guildsArr, created: created)
//            
//            gotAccountCallback(account)
//        })
//    }
//    
//    class func getGuildDataWithID(id: String, gotGuildCallback: (TMGuild) -> ()) {
//        let guildURL = TM_GW2API_GUILD_DETAILS_URL.stringByReplacingOccurrencesOfString("$GUILD_ID", withString: id)
//        
//        TMDataManager.getAPIDataFromURLWithSuccess(guildURL, success: {(data) -> Void in
//            let parsedObject: AnyObject?
//            
//            do {
//                parsedObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
//            } catch _ {
//                parsedObject = nil
//            }
//            
//            guard let parsedGuild = parsedObject as? NSDictionary else {return}
//            guard let id = parsedGuild["guild_id"] as? String else {return}
//            guard let name = parsedGuild["guild_name"] as? String else {return}
//            guard let tag = parsedGuild["tag"] as? String else {return}
//            guard let parsedEmblem = parsedGuild["emblem"] as? NSDictionary else {return}
//            guard let backgroundID = parsedEmblem["background_id"] as? Int else {return}
//            guard let foregroundID = parsedEmblem["foreground_id"] as? Int else {return}
//            guard let flags = parsedEmblem["flags"] as? NSArray else {return}
//            guard let backgroundColorID = parsedEmblem["background_color_id"] as? Int else {return}
//            guard let foregroundPrimaryColorID = parsedEmblem["foreground_primary_color_id"] as? Int else {return}
//            guard let foregroundSecondaryColorID = parsedEmblem["foreground_secondary_color_id"] as? Int else {return}
//            
//            let emblem = TMGuildEmblem.init(withBackgroundID: backgroundID, foregroundID: foregroundID, flags: flags as! [String], backgroundColorID: backgroundColorID, foregroundPrimaryColorID: foregroundPrimaryColorID, foregroundSecondaryColorID: foregroundSecondaryColorID)
//            
//            let guild = TMGuild.init(withID: id, name: name, tag: tag, emblem: emblem)
//            
//            gotGuildCallback(guild)
//        })
//    }
}