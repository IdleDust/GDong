//
//  CalenderTableViewController.swift
//  GDong
//
//  Created by JuanChen on 16/5/12.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class CalenderTableViewController: UITableViewController {
    
    var numberOfActivities:Int = 1
    var pageIndication:Int = -1 //mark which of the page we currently on
    let pageTitle:[String] = ["活动日程", "订单管理", "消息", "邀请有礼", "优惠礼券", "报名信息", "我的收藏", "小秘书", "设置"]
    
    //MARK - adjust cell height automatically
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 500
        tableView.backgroundColor = Lib.darkerBlueColor
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func setNavigationBarTitle(){
        if(pageIndication < 0 || pageIndication >= pageTitle.count) {
            print("PAGE NUMBER ERROR!!! Recovered to 0 instead.")
            self.title = pageTitle[pageIndication]
        } else {
            self.title = pageTitle[pageIndication]
        }
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.boldSystemFontOfSize(20)]
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        print("pageIndication is: \(pageIndication)")
        
    }
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
        if(pageIndication == 0){
            if(numberOfActivities == 0){
                return numberOfActivities+1;
            } else {
                return numberOfActivities;
            }
        }else if(pageIndication == 1){
           return 3
            //revise here~~~~~~~~~~~~~
        } else {
            if(numberOfActivities == 0){
                return numberOfActivities+1;
            } else {
                return numberOfActivities;
            }
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(numberOfActivities > 0) {
            let cell = tableView.dequeueReusableCellWithIdentifier("calenderCell", forIndexPath: indexPath) as! CalenderTableViewCell
            cell.activityTitle.text = "给你一个彩色圣诞"
            cell.activitySubtitle.text = "时间： 2015.12.25 14：00-16：30"
            cell.activityImage.image = UIImage(named: "page6")
            cell.numberOfOrders.text = "1份"
            cell.orderCode.text = "2031 5642 09"
            cell.layer.backgroundColor = Lib.darkerBlueColor.CGColor
            return cell
        } else {
            let emptyCell = tableView.dequeueReusableCellWithIdentifier("emptyCalenderCell", forIndexPath: indexPath)
            emptyCell.layer.backgroundColor = Lib.darkerBlueColor.CGColor
            return emptyCell
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
