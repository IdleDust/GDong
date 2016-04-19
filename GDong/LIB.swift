//
//  CommonViewController.swift
//  GDong
//
//  Created by JuanChen on 16/4/7.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

var Lib:LIB?

class LIB: NSObject {
    
    let customColor = UIColor(red: 99/255.0, green: 213/255.0, blue: 211/255.0, alpha: 1)

    func addTextFieldBorder(textField: UITextField, width:CGFloat = CGFloat(1.2), color: UIColor=UIColor.lightGrayColor()){
        
        let border = CALayer()
        border.borderColor = color.CGColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
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
