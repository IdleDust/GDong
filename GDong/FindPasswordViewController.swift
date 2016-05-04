//
//  FindPasswordViewController.swift
//  GDong
//
//  Created by JuanChen on 16/4/7.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit


class FindPasswordViewController: UIViewController {
    
    @IBOutlet weak var userPhoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidLayoutSubviews(){
        let color = UIColor(red: 239/255, green: 240/255, blue: 241/255, alpha: 1)
        Lib.addTextFieldBorder(userPhoneNumber,width:2, color: color)
    }
}
