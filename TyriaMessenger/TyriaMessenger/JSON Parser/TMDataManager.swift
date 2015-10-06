//
//  TMJSONParser.swift
//  TyriaMessenger
//
//  Created by Christian Grimsgaard on 02/10/15.
//  Copyright © 2015 ChristianGrimsgaard. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class TMDataManager {
    class func getAPIDataFromURL(url: String, headers: [String: String]?, parameters: [String: AnyObject]?) {
        Alamofire.request(.GET, url, headers: headers, parameters: parameters).responseJSON(completionHandler: {(request, response, result) in
            if let JSON = result.value {
                print(JSON)
            }
        })
    }
    
    class func getAccountDataFromURL(url: String, headers: [String: String]?, parameters: [String: AnyObject]?) {
        Alamofire.request(.GET, url, headers: headers, parameters: parameters).responseJSON(completionHandler: {(request, response, result) in
            guard let res = result.value else {return}
            
            let json = JSON(res)
            print("JSON for account fetched:\n\(json)\n")
            
            for (_, guildID):(String, JSON) in json["guilds"] {
                getGuildDataFromURL(TM_GW2API_GUILD_DETAILS_URL, headers: nil, parameters: ["guild_id": guildID.stringValue])
            }
            
            let account = TMJSONParser.parseAccount(json)
            
            TMManager.sharedInstance.account = account
        })
    }
    
    class func getGuildDataFromURL(url: String, headers: [String: String]?, parameters: [String: AnyObject]?) {
        Alamofire.request(.GET, url, headers: headers, parameters: parameters).responseJSON(completionHandler: {(request, response, result) in
            guard let res = result.value else {return}
            
            let json = JSON(res)
            print("JSON for guild fetched:\n\(json)\n")
            
            let guild = TMJSONParser.parseGuild(json)
            
            TMManager.sharedInstance.guildList.append(guild)
        })
    }
}