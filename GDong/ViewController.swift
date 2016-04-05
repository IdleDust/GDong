//
//  ViewController.swift
//  GDong
//
//  Created by JuanChen on 16/4/5.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    @IBOutlet weak var sendVerificationCode: UIButton!
    
    @IBOutlet weak var textVerificationTextField: UITextField!
        
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    func addTextFieldBorder(textField: UITextField){
        let border = CALayer()
        let width = CGFloat(1.2)
        border.borderColor = UIColor.lightGrayColor().CGColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width:  textField.frame.size.width, height: textField.frame.size.height)

        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    
    
    override func viewDidLayoutSubviews() {
        
        addTextFieldBorder(phoneNumberTextField)
        addTextFieldBorder(textVerificationTextField)
        addTextFieldBorder(passwordTextField)
        

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

