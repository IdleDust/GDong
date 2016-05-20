//
//  AllOrderDetailsTableViewController.swift
//  GDong
//
//  Created by JuanChen on 16/5/19.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class ExistingOrderDetailsTableViewController: UITableViewController {
    
    var orderNumber: String = ""
    var orderStatus: Int = -1

    //Mark - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 6
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("existingOrderDetailCell1", forIndexPath: indexPath)

        return cell
    }
    //Mark - Event response
    
    //Mark - private methods
    
    //Mark - getters and setters


}
