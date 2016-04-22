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
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numOfRows = 1
        if(section == 0){
            numOfRows = 2
        }else if(section == 1){
            numOfRows = 2
        }
        return numOfRows
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        
        if(section == 0){
            if(row == 0){
                let cell = tableView.dequeueReusableCellWithIdentifier("clubPic", forIndexPath: indexPath) as! ClubPhotoTableViewCell
                cell.clubPhoto.image = UIImage(named: "sea")
                cell.clubName.text = "爱游.亲子俱乐部"
                cell.clubSubName.text = "让你的孩子成为快乐的冒险家"
                cell.clubName.layer.zPosition = 1
                cell.clubSubName.layer.zPosition = 1
                return cell
            } else {
                let cell = tableView.dequeueReusableCellWithIdentifier("clubIntroduction", forIndexPath: indexPath) as! ClubIntroTableViewCell
                //let ratio = CGFloat(89/100.0)
                //cell.clubPhoto.frame = CGRectMake(0,0,self.view.frame.width, self.view.frame.width * ratio)
                return cell
            }
        }else if(section == 1){
            if(row == 0){
                let cell = tableView.dequeueReusableCellWithIdentifier("teacherIntro", forIndexPath: indexPath) as! TeacherIntroTitleTableViewCell
                return cell
            }
            else {
                let cell = tableView.dequeueReusableCellWithIdentifier("prototype", forIndexPath: indexPath)
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("prototype", forIndexPath: indexPath)
            return cell
        }
    
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
