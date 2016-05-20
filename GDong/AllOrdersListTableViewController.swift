//
//  AllOrdersTableViewController.swift
//  GDong
//
//  Created by JuanChen on 16/5/12.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class AllOrdersListTableViewController: UITableViewController {
    
    let pageTitle = Lib.pageName[1]
    
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 500
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    //Mark - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setNavigationBarTitle()
    }
    
    override func viewWillAppear(animated: Bool) {
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func setNavigationBarTitle(){
        self.title = pageTitle
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.boldSystemFontOfSize(20)]
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(indexPath.row == 0) {
            let cell = tableView.dequeueReusableCellWithIdentifier("orderDetailCell", forIndexPath: indexPath) as! OrderDetailTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("orderNextStepCell", forIndexPath: indexPath) as! OrderNextStageStatusTableViewCell
            Lib.addUIButtonBorder(cell.orderNextStageButton)
            return cell
            
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
    
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

    //Mark - Event response
    
    //Mark - private methods
    
    //Mark - getters and setters
    
    // MARK: - Navigation
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showExistingOrderDetailsSegue", sender: self)
    }
    
    
 // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if  segue.identifier == "showExistingOrderDetailsSegue" {
            //print("segue---")
            if let destination = segue.destinationViewController as? ExistingOrderDetailsTableViewController{
                if let indexPath = self.tableView.indexPathForSelectedRow {
                   
                    //let orderNumber = indexPath.order_number
                    //destination.orderNumber = orderNumber
                }
                
            }
        }
    }
    

}
