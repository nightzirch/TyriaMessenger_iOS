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
        let guild = TMManager.sharedInstance.guildList[indexPath.row]
        
        cell.guildName.text = guild.name
        cell.guildEmblem.image = UIImage(named: "Guild Emblem")
        
        // Fetch guild emblem image from Dulfy
//        var urlString = "\(TM_GUILD_EMBLEM_BASE_URL)\(guild.name)/200.png"
//        urlString = urlString.stringByReplacingOccurrencesOfString(" ", withString: "%20")
//        let url = NSURL(string: urlString)
//        downloadImage(url!, indexPath: indexPath)
        
        cell.accessoryType = .DisclosureIndicator
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func handleRefresh(refreshControl: UIRefreshControl) {
        self.tableView.reloadData()
        refreshControl.endRefreshing()
        
        TMManager.sharedInstance.sendAccountToWatch()
        TMManager.sharedInstance.sendGuildListToWatch()
    }
    
    
    func getDataFromUrl(urL:NSURL, completion: ((data: NSData?) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(urL) { (data, response, error) in
            completion(data: data)
            }.resume() 
    }
    
    func downloadImage(url: NSURL, indexPath: NSIndexPath){
        print("Started downloading from URL: \(url)")
        getDataFromUrl(url) { data in
            dispatch_async(dispatch_get_main_queue()) {
                print("Finished downloading from URL: \(url).")
                let cell = self.tableView.cellForRowAtIndexPath(indexPath) as! TMGuildTableViewCell
                print(data)
                cell.guildEmblem.image = UIImage(data: data!)
                print("Image set")
            }
        }
    }

}