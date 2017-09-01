//
//  CommonViewController.swift
//  GDong
//
//  Created by JuanChen on 16/4/7.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

//var Lib:LIB?

class Lib: NSObject {
    
    static let customColor = UIColor(red: 99/255.0, green: 213/255.0, blue: 211/255.0, alpha: 1)
    static let darkerBlueColor = UIColor(red: 86/255.0, green: 197/255.0, blue: 188/255.0, alpha: 1)
    static let calenderBackgroundColor = UIColor(red: 87/255.0, green: 212/255.0, blue: 209/255.0, alpha: 1)
    static let pageName:[String] = ["活动日程", "订单管理", "消息", "邀请有礼", "优惠礼券", "报名信息", "我的收藏", "小秘书", "设置"]

    static func addTextFieldBorder(_ textField: UITextField, width:CGFloat = CGFloat(1.2), color: UIColor=UIColor.lightGray){
        
        let border = CALayer()
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)
        
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    
    static func addUIButtonBorder(_ button: UIButton){
        button.layer.borderWidth = 2.0
        button.layer.borderColor = (UIColor(red: 99/255.0, green: 213/255.0, blue: 211/255.0, alpha: 0.61)).cgColor
        button.layer.cornerRadius = 10
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
