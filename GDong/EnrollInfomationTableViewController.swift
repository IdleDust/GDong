//
//  EnrollInfomationTableViewController.swift
//  GDong
//
//  Created by JuanChen on 16/5/19.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class EnrollInfomationTableViewController: UITableViewController {
    let pageTitle = Lib.pageName[5]

    //Mark - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarTitle()

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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if((indexPath as NSIndexPath).row == 0){
        let cell = tableView.dequeueReusableCell(withIdentifier: "thumbImg", for: indexPath) as! ProfileThumbImgTableViewCell
            cell.thumbImage.image = UIImage(named: "user")
            return cell;
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "otherProfileInfo", for: indexPath) as! ProfileOtherInfoTableViewCell
            if((indexPath as NSIndexPath).row == 1){
                cell.cellTitle.text = "姓名"
                cell.cellContent.text = "王小明"
            } else if ((indexPath as NSIndexPath).row == 2){
                cell.cellTitle.text = "性别"
                cell.cellContent.text = "男"
            } else if ((indexPath as NSIndexPath).row == 3){
                cell.cellTitle.text = "出生年月"
                cell.cellContent.text = "2007-09-07"
            } else if ((indexPath as NSIndexPath).row == 4){
                cell.cellTitle.text = "身份证号"
                cell.cellContent.text = "510***********0913"
        }
            return cell;
        }
    }
    
    //Mark - Event response
    
    //Mark - private methods
    func setNavigationBarTitle(){
        self.title = pageTitle
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 20)]
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    
    //Mark - getters and setters
    

}
