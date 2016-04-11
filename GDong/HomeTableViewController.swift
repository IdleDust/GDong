//
//  HomeTableViewController.swift
//  GDong
//
//  Created by JuanChen on 16/4/8.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    @IBOutlet weak var leftButtonItem: UIBarButtonItem!
    
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 660.0
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        
        let logo = UIImage(named: "果动.png")
        self.navigationItem.titleView = UIImageView(image:logo)
        self.navigationItem.titleView!.sizeToFit()

        //custom barbuttonitem image
        let button = UIButton()
        button.frame = CGRectMake(0, 0, 66, 66)
        button.setImage(UIImage(named: "user"), forState: .Normal)
        leftButtonItem.customView = button
        self.navigationItem.leftBarButtonItem = leftButtonItem
        button.addTarget(self, action: "userLogin", forControlEvents: UIControlEvents.TouchUpInside)
        //add space to leftButtonItem
        let negativeSpacer:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FixedSpace, target: nil, action: nil)
        negativeSpacer.width = -20; // set the value you need
        self.navigationItem.leftBarButtonItems = [negativeSpacer,leftButtonItem]
        
    }
    
    func userLogin() {
        performSegueWithIdentifier("userLogin", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    
    //override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    //    return 360.0
    //}


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
