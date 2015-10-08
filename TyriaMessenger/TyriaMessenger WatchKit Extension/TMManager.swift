//
//  TMManager.swift
//  TyriaMessenger
//
//  Created by Christian Grimsgaard on 07/10/15.
//  Copyright © 2015 ChristianGrimsgaard. All rights reserved.
//

import Foundation
import WatchKit
import WatchConnectivity

private let TMManagerSharedInstance = TMManager()

public class TMManager: NSObject, WCSessionDelegate {
    var account = TMAccount()
    var guildList = [TMGuild]()
    
    var session: WCSession!
    
    public class var sharedInstance : TMManager {
        return TMManagerSharedInstance
    }
    
    public override init() {
        super.init()
        
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
    }
    
//    public func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
//        for (key, value) in message {
//            switch key {
//            case "guildList":
//                self.guildList = value as! [TMGuild]
//                break
//            case "account":
//                self.account = value as! TMAccount
//                break
//            default:
//                break
//            }
//        }
//        
//        replyHandler(["status": "success"])
//    }
    
    public func session(session: WCSession, didReceiveApplicationContext applicationContext: [String : AnyObject]) {
        for (key, value) in applicationContext {
            switch key {
                case "guildList":
                    if let guildDictArr = value as? [NSDictionary] {
                        guildList.removeAll()
                        
                        for guildDict in guildDictArr {
                            guard let id = guildDict["id"] as? String,
                                let name = guildDict["name"] as? String,
                                let tag = guildDict["tag"] as? String,
                                let emblemData = guildDict["emblemData"] as? NSData,
                                let emblemDict = guildDict["emblem"] as? NSDictionary,
                                let backgroundID = emblemDict["backgroundID"] as? Int,
                                let backgroundColorID = emblemDict["backgroundColorID"] as? Int,
                                let foregroundID = emblemDict["foregroundID"] as? Int,
                                let foregroundPrimaryColorID = emblemDict["foregroundPrimaryColorID"] as? Int,
                                let foregroundSecondaryColorID = emblemDict["foregroundSecondaryColorID"] as? Int,
                                let flags = emblemDict["flags"] as? [String]
                                else {return}
                            
                            let emblem = TMGuildEmblem.init(withBackgroundID: backgroundID, backgroundColorID: backgroundColorID, foregroundID: foregroundID, foregroundPrimaryColorID: foregroundPrimaryColorID, foregroundSecondaryColorID: foregroundSecondaryColorID, flags: flags)
                            let guild = TMGuild.init(withID: id, name: name, tag: tag, emblem: emblem, emblemData: emblemData)
                            
                            guildList.append(guild)
                        }
                    }
                    
                    break
                case "account":
                    guard let accountDict = value as? NSDictionary,
                          let id = accountDict["id"] as? String,
                          let name = accountDict["name"] as? String,
                          let world = accountDict["world"] as? Int,
                          let guilds = accountDict["guilds"] as? [String],
                          let created = accountDict["created"] as? String
                        else {return}
                    
                    let accountObj = TMAccount.init(withID: id, name: name, world: world, guilds: guilds, created: created)
                    
                    account = accountObj
                    
                    break
                default:
                    break
            }
        }
    }
}