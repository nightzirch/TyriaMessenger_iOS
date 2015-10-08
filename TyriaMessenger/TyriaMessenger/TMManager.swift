//
//  TMManager.swift
//  TyriaMessenger
//
//  Created by Christian Grimsgaard on 24/09/15.
//  Copyright © 2015 ChristianGrimsgaard. All rights reserved.
//

import Foundation
import WatchConnectivity
import EVReflection
import SwiftyJSON

private let TMManagerSharedInstance = TMManager()

public class TMManager: NSObject, WCSessionDelegate {
    var account = TMAccount()
    var guildList = [TMGuild]()
    var defaults = NSUserDefaults.standardUserDefaults()
    
    var session: WCSession!
    
    public class var sharedInstance : TMManager {
        return TMManagerSharedInstance
    }
    
    func updateData() {
        let APIToken = "26509F8B-4F0D-FD4F-8762-2722633813D6C467BEA8-46C4-4835-BA9E-F9EECC7FF7B4"
        let params = [
            "access_token": APIToken
        ]
        
        TMDataManager.getAccountDataFromURL(TM_GW2API_ACCOUNT_URL, headers: nil, parameters: params)
    }
    
    public override init() {
        super.init()
        
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
        
        sendGuildListToWatch()
        
        updateData()
    }
    
    func setAPIToken(token: String) {
        defaults.setObject(token, forKey: TM_API_TOKEN_KEY)
    }
    
    func getAPIToken() -> String {
        if defaults.objectForKey(TM_API_TOKEN_KEY) != nil {
            return defaults.stringForKey(TM_API_TOKEN_KEY)!
        }
        
        return ""
    }
    
    func sendGuildListToWatch() {
        print("Sending guild list to watch")
        
        var guildDictArr = [NSDictionary]()
        
        for guild in guildList {
            let emblemDict = guild.emblem.toDictionary()
            let guildDict = guild.toDictionary()
            guildDict.setValue(emblemDict, forKey: "emblem")
            guildDictArr.append(guildDict)
        }
        
        print(guildDictArr)
        
        do {
            try session.updateApplicationContext(["guildList": guildDictArr])
        } catch {
            print(error)
        }
    }
    
    func sendAccountToWatch() {
        print("Sending account to watch")
        
        let accountDict = account.toDictionary()
        
        print(accountDict)
        
        do {
            try session.updateApplicationContext(["account": accountDict])
        } catch {
            print(error)
        }
    }
    
    
}