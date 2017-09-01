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
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfMessages
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as! MessageTableViewCell
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func setNavigationBarTitle(){
        self.title = pageTitle
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 20)]
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    //Mark - getters and setters
    //MARK - Navigation Views
    

}
