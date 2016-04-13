//
//  EventDetailTableViewController.swift
//  GDong
//
//  Created by JuanChen on 16/4/11.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class ActivityDetailTableViewController: UITableViewController{

    
    
    
    
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 600
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("activityPic", forIndexPath: indexPath) as! ActivityPicTableViewCell
        if (indexPath.section == 0) {
            
                // return left/right label style cell
            //cell.textLabel?.text = "Section 0"
            //cell.activityTitle.text = "Title"
            
        } else if (indexPath.section == 1){
            cell.textLabel?.text = "Section 1"
        
        } else {
            cell.textLabel?.text = "Section 2"
        }

        return cell
    
    }

    
}
