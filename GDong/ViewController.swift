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
    @IBOutlet weak var sendVerificationCodeButton: UIButton!
    @IBOutlet weak var textVerificationTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpOrLoginButton: UIButton!
    @IBOutlet weak var SignUpIndicationButton: UIButton!
    @IBOutlet weak var LoginIndicationButton: UIButton!
    @IBOutlet weak var forgetPasswordStackView: UIStackView!
    @IBOutlet weak var userAgreementStackView: UIStackView!
    
    var signUpMode = true;
    
    @IBAction func showSignUpTable(sender: AnyObject) {
        
        signUpMode = true;
        let customColor = UIColor(red: 99/255.0, green: 213/255.0, blue: 211/255.0, alpha: 1)
        SignUpIndicationButton.setTitleColor(customColor, forState: .Normal)
        LoginIndicationButton.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        forgetPasswordStackView.hidden = true
        userAgreementStackView.hidden = false
        signUpOrLoginButton.setTitle("注册", forState: .Normal)
        textVerificationTextField.hidden = false
        
        for constraint in self.view.constraints {
            if constraint.identifier == "passwordTopCons" {
                constraint.constant = 65
            }
            
        }
        sendVerificationCodeButton.hidden = false

    }
    
    @IBAction func showLoginTable(sender: AnyObject) {
        
        signUpMode = false;
        userAgreementStackView.hidden = true
        let customColor = UIColor(red: 99/255.0, green: 213/255.0, blue: 211/255.0, alpha: 1)
        LoginIndicationButton.setTitleColor(customColor, forState: .Normal)
        SignUpIndicationButton.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        forgetPasswordStackView.hidden = false
        sendVerificationCodeButton.hidden = true
        textVerificationTextField.hidden = true
        
        for constraint in self.view.constraints {
            if constraint.identifier == "passwordTopCons" {
                constraint.constant = 10
            }
            
        }
        signUpOrLoginButton.setTitle("登录", forState: .Normal)
    
    }
    
    @IBAction func signUpOrLogin(sender: AnyObject) {
        if(signUpMode == true){
            //signing up
        } else {
            //Logining in
        }
    
    }
    
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
        
        sendVerificationCodeButton.layer.borderWidth = 2.0
        sendVerificationCodeButton.layer.borderColor = (UIColor(red: 99/255.0, green: 213/255.0, blue: 211/255.0, alpha: 0.61)).CGColor
        sendVerificationCodeButton.layer.cornerRadius = 10
    }

    override func viewWillAppear(animated: Bool) {
        print("view will appear")
        let customColor = UIColor(red: 99/255.0, green: 213/255.0, blue: 211/255.0, alpha: 1)
        if(signUpMode == true){
            forgetPasswordStackView.hidden = true
            SignUpIndicationButton.setTitleColor(customColor, forState: .Normal)
            LoginIndicationButton.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

