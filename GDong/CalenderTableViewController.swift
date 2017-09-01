//
//  CalenderTableViewController.swift
//  GDong
//
//  Created by JuanChen on 16/5/12.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class CalenderTableViewController: UITableViewController {
    
    var pageTitle = Lib.pageName[0]
    var numberOfActivities:Int = 1
    
    //MARK - adjust cell height automatically
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 500
        tableView.backgroundColor = Lib.darkerBlueColor
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    func setNavigationBarTitle(){
        self.title = pageTitle
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 20)]
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
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

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(numberOfActivities == 0){
            return numberOfActivities+1;
        } else {
            return numberOfActivities;
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(numberOfActivities > 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "calenderCell", for: indexPath) as! CalenderTableViewCell
            cell.activityTitle.text = "给你一个彩色圣诞"
            cell.activitySubtitle.text = "时间： 2015.12.25 14：00-16：30"
            cell.activityImage.image = UIImage(named: "page6")
            cell.numberOfOrders.text = "1份"
            cell.orderCode.text = "2031 5642 09"
            cell.layer.backgroundColor = Lib.darkerBlueColor.cgColor
            return cell
        } else {
            let emptyCell = tableView.dequeueReusableCell(withIdentifier: "emptyCalenderCell", for: indexPath)
            emptyCell.layer.backgroundColor = Lib.darkerBlueColor.cgColor
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
