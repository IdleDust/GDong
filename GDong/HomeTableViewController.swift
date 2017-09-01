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
        button.frame = CGRect(x: 0, y: 0, width: 66, height: 66)
        button.setImage(UIImage(named: "user"), for: UIControlState())
        leftButtonItem.customView = button
        self.navigationItem.leftBarButtonItem = leftButtonItem
        button.addTarget(self, action: #selector(HomeTableViewController.userLogin), for: UIControlEvents.touchUpInside)
        //add space to leftButtonItem
        let negativeSpacer:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        negativeSpacer.width = -20; // set the value you need
        self.navigationItem.leftBarButtonItems = [negativeSpacer,leftButtonItem]
        
    }
    
    func userLogin() {
        performSegue(withIdentifier: "userLogin", sender: nil)
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

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ActivityTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ActivityTableViewCell

        // Configure the cell...

        return cell
    }





}
