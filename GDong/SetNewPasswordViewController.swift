//
//  SetNewPasswordViewController.swift
//  GDong
//
//  Created by JuanChen on 16/4/7.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class SetNewPasswordViewController: UIViewController {
    
    @IBOutlet weak var textVerificationCode: UITextField!
    
    @IBOutlet weak var newPassword: UITextField!

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
        Lib.addTextFieldBorder(textVerificationCode,width:2, color: color)
        Lib.addTextFieldBorder(newPassword, width: 2, color:color)
    }
    
    override func viewWillAppear(animated: Bool) {
        
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
