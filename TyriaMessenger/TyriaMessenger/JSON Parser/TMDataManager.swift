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
            if let JSON = result.value {
                print(JSON)
                
                let id = JSON[0]["id"].string
                let name = JSON[0]["name"] as! String
                let world = JSON[0]["world"] as! Int
                let guilds = JSON[0]["guilds"] as! Array
                let created = JSON[0]["created"] as! String
                
                TMManager.sharedInstance.account = TMAccount.init(withID: id, name: name, world: world, guilds: guilds, created: created)
            }
        })
    }
}