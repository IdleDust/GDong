//
//  MessagesTableViewController.swift
//  GDong
//
//  Created by JuanChen on 16/5/13.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class MessagesTableViewController: UITableViewController {
    let pageTitle = Lib.pageName[2]
    var numberOfMessages = 10
    
    //Mark - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setNavigationBarTitle()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfMessages
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("messageCell", forIndexPath: indexPath) as! MessageTableViewCell
        cell.messageContent.text = "您参加的[给你一个彩色圣诞]已成功使用， Have Fun！"
        cell.messageButton.imageView?.image = UIImage(named:"right_small")
        cell.messageTime.text = "12-25 23:20"
        return cell
    }
    //Mark - Event response
    
    
    
    //Mark - private methods
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 500
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func setNavigationBarTitle(){
        self.title = pageTitle
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.boldSystemFontOfSize(20)]
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    //Mark - getters and setters
    //MARK - Navigation Views
    

}
