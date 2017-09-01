//
//  ClubDetailTableViewController.swift
//  GDong
//
//  Created by JuanChen on 16/4/21.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class ClubDetailTableViewController: UITableViewController {
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 500
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numOfRows = 1
        if(section == 0){
            numOfRows = 2
        }else if(section == 1){
            numOfRows = 3
        }
        else if(section == 2){
            numOfRows = 3
        }
        return numOfRows
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = (indexPath as NSIndexPath).section
        let row = (indexPath as NSIndexPath).row
        
        if(section == 0){
            if(row == 0){
                let cell = tableView.dequeueReusableCell(withIdentifier: "clubPic", for: indexPath) as! ClubPhotoTableViewCell
                cell.clubPhoto.image = UIImage(named: "sea")
                cell.clubName.text = "爱游.亲子俱乐部"
                cell.clubSubName.text = "让你的孩子成为快乐的冒险家"
                cell.clubName.layer.zPosition = 1
                cell.clubSubName.layer.zPosition = 1
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "clubIntroduction", for: indexPath) as! ClubIntroTableViewCell
                //let ratio = CGFloat(89/100.0)
                //cell.clubPhoto.frame = CGRectMake(0,0,self.view.frame.width, self.view.frame.width * ratio)
                return cell
            }
        }else if(section == 1){
            if(row == 0){
                let cell = tableView.dequeueReusableCell(withIdentifier: "teacherIntro", for: indexPath) as! TeacherIntroTitleTableViewCell
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "teacherList", for: indexPath) as! TeacherListTableViewCell
                return cell
            }
        } else if(section == 2){
            if(row == 0){
                let cell = tableView.dequeueReusableCell(withIdentifier: "clubActivitiesTitle", for: indexPath) as! ClubActivitiesTitleTableViewCell
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "clubActivities", for: indexPath) as! ActivityTableViewCell
                return cell
            }
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "prototype", for: indexPath)
            return cell
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
