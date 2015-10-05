//
//  TMGuildTableViewController.swift
//  TyriaMessenger
//
//  Created by Christian Grimsgaard on 24/09/15.
//  Copyright © 2015 ChristianGrimsgaard. All rights reserved.
//

import Foundation
import UIKit

class TMGuildTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TMManager.sharedInstance.guildList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TMGuildCell") as! TMGuildTableViewCell
        cell.guildName.text = TMManager.sharedInstance.guildList[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}