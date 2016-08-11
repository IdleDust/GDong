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
        if(section == 0){
            return 1;
        }else if(section == 1){
            return 4;
        }else if(section == 2){
            return 2;
        }else if(section == 3){
            return 3;
        }else if(section == 4){
            return 3;
        }else{
            return 2;
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title:String = "";
        if(section == 1){
            title = "支付码";
        } else if (section == 2) {
            title = "活动信息";
        } else if (section == 3){
            title = "订单信息";
        } else if (section == 4){
            title = "支付信息";
        }
        return title;
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            let cell = tableView.dequeueReusableCellWithIdentifier("existingOrderDetailCell0", forIndexPath: indexPath)
            return cell
        }
        let cell = tableView.dequeueReusableCellWithIdentifier("existingOrderDetailCell1", forIndexPath: indexPath)
        
        return cell
    }
    //Mark - Event response
    
    //Mark - private methods
    
    //Mark - getters and setters


}
