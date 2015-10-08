//
//  TMGuildTableInterfaceController
//  TyriaMessenger WatchKit Extension
//
//  Created by Christian Grimsgaard on 07/10/15.
//  Copyright © 2015 ChristianGrimsgaard. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class TMGuildTableInterfaceController: WKInterfaceController {
    @IBOutlet weak var guildTable: WKInterfaceTable!
    
    
    var session: WCSession!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        reloadTable()
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }
    
    @IBAction func refreshMenuButton() {
        reloadTable()
    }
    
    func reloadTable() {
        let guildList = TMManager.sharedInstance.guildList
        
        guildTable.setNumberOfRows(guildList.count, withRowType: "TMGuildTableInterfaceCell")
        
        for (index, guild) in guildList.enumerate() {
            if let row = guildTable.rowControllerAtIndex(index) as? TMGuildTableInterfaceCell {
                row.guildName.setText(guild.name)
                row.guildTag.setText(guild.tag)
                row.guildEmblem.setImage(UIImage(data: guild.emblemData))
            }
        }
    }
}
