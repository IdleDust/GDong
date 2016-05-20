//
//  SettingTableViewController.swift
//  GDong
//
//  Created by JuanChen on 16/5/19.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    let pageTitle = Lib.pageName[8]

    //Mark - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarTitle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 2;
        } else {
            return 4;
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            if(indexPath.row == 0){
                let cell = tableView.dequeueReusableCellWithIdentifier("emptyCache", forIndexPath: indexPath) as! EmptyCacheSettingTableViewCell
                cell.cellTitle.text = "清除缓存"
                cell.cacheSize.text = "2.4M"
                cell.arrowImage.image = UIImage(named: "right_small")
                return cell;
            } else {
                
                let cell = tableView.dequeueReusableCellWithIdentifier("versionCell", forIndexPath: indexPath) as! VersionSettingTableViewCell
                cell.versionTitle.text = "版本信息"
                cell.appVersion.text = "v1.0(0024)"
                return cell
            }
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("otherSettingCell", forIndexPath: indexPath) as! OtherSettingTableViewCell
            if(indexPath.row == 0){
                cell.otherSettingTitle.text = "常见问题"
            }
            else if(indexPath.row == 1){
                cell.otherSettingTitle.text = "用户协议及服务条款"
            }
            else if(indexPath.row == 2){
                cell.otherSettingTitle.text = "欢迎页"
            }
            else if(indexPath.row == 3){
                cell.otherSettingTitle.text = "给我们打分"
            }
        
            return cell;
        }
    }
    
    //MARK - Custom Footer For Each Section
    override func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let footer:UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        footer.contentView.backgroundColor = UIColor.lightGrayColor()
        footer.alpha = 0.2
        footer.textLabel!.text = ""
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(10)
    }
    
    //Mark - Event response
    
    //Mark - private methods
    func setNavigationBarTitle(){
        self.title = pageTitle
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.boldSystemFontOfSize(20)]
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }
    
    
    //Mark - getters and setters
}
