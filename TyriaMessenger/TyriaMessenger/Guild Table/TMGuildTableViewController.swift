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
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "handleRefresh:", forControlEvents: UIControlEvents.ValueChanged)
        
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        self.tableView.addSubview(self.refreshControl)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TMManager.sharedInstance.guildList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TMGuildCell") as! TMGuildTableViewCell

        cell.guildName.text = TMManager.sharedInstance.guildList[indexPath.row].name
        cell.guildEmblem.image = UIImage(named: "Guild Emblem")
        
        cell.accessoryType = .DisclosureIndicator
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func handleRefresh(refreshControl: UIRefreshControl) {
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
}