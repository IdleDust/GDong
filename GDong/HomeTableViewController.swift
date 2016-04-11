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
    
    //caculate cell height dynamically
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

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> EventTableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! EventTableViewCell

        // Configure the cell...

        return cell
    }





}
