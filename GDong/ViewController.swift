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
    let customColor = UIColor(red: 99/255.0, green: 213/255.0, blue: 211/255.0, alpha: 1)
    
    @IBAction func showSignUpTable(_ sender: AnyObject) {
        
        signUpMode = true;
        SignUpIndicationButton.setTitleColor(customColor, for: UIControlState())
        addBottomBorder(SignUpIndicationButton, tag: "signUpBottomBorder")
        LoginIndicationButton.setTitleColor(UIColor.lightGray, for: UIControlState())
        deleteBottomBorder(LoginIndicationButton, tag: "loginBottomBorder")
        
        forgetPasswordStackView.isHidden = true
        userAgreementStackView.isHidden = false
        signUpOrLoginButton.setTitle("注册", for: UIControlState())
        textVerificationTextField.isHidden = false
        
        
        for constraint in self.view.constraints {
            if constraint.identifier == "passwordTopCons" {
                constraint.constant = 65
            }
            
        }
        sendVerificationCodeButton.isHidden = false
        

    }
    
    @IBAction func showLoginTable(_ sender: AnyObject) {
        
        signUpMode = false;
        userAgreementStackView.isHidden = true
        
        LoginIndicationButton.setTitleColor(customColor, for: UIControlState())
        addBottomBorder(LoginIndicationButton, tag: "loginBottomBorder")
        SignUpIndicationButton.setTitleColor(UIColor.lightGray, for: UIControlState())
        deleteBottomBorder(SignUpIndicationButton, tag: "signUpBottomBorder")
        forgetPasswordStackView.isHidden = false
        sendVerificationCodeButton.isHidden = true
        textVerificationTextField.isHidden = true
        
        for constraint in self.view.constraints {
            if constraint.identifier == "passwordTopCons" {
                constraint.constant = 10
            }
            
        }
        signUpOrLoginButton.setTitle("登录", for: UIControlState())
    
    }
    
    @IBAction func signUpOrLogin(_ sender: AnyObject) {
        if(signUpMode == true){
            //signing up
            print("Signning up")
            
        } else {
            //Logining in
            print("logging in")
            performSegue(withIdentifier: "loginSucceed", sender: sender)
        }
    }
    
    
    func addBottomBorder(_ button: UIButton, tag: String) {
        let bottomBorder = CALayer()
        let width = CGFloat(1.2)
        bottomBorder.borderColor = customColor.cgColor
        bottomBorder.frame = CGRect(x: 0, y: button.frame.size.height-width, width: button.frame.size.width, height: button.frame.size.height)
        bottomBorder.borderWidth = width
        bottomBorder.name = tag
        button.layer.addSublayer(bottomBorder)
        button.layer.masksToBounds = true
    }
    
    func deleteBottomBorder(_ button: UIButton, tag: String) {
        for layer in button.layer.sublayers! {
            if(layer.name == tag){
                layer.removeFromSuperlayer()
            }
        }
    }
    
    
    
    
    override func viewDidLayoutSubviews() {
        
        Lib.addTextFieldBorder(phoneNumberTextField)
        Lib.addTextFieldBorder(textVerificationTextField)
        Lib.addTextFieldBorder(passwordTextField)
        
        sendVerificationCodeButton.layer.borderWidth = 2.0
        sendVerificationCodeButton.layer.borderColor = (UIColor(red: 99/255.0, green: 213/255.0, blue: 211/255.0, alpha: 0.61)).cgColor
        sendVerificationCodeButton.layer.cornerRadius = 10
    }

    override func viewWillAppear(_ animated: Bool) {
        
        if(signUpMode == true){
            forgetPasswordStackView.isHidden = true
            SignUpIndicationButton.setTitleColor(customColor, for: UIControlState())
            LoginIndicationButton.setTitleColor(UIColor.lightGray, for: UIControlState())
            addBottomBorder(SignUpIndicationButton, tag: "signUpBottomBorder")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "loginSucceed" {
            //print("segue---")
            if let destination = segue.destination as? UINavigationController{
                if let viewContr = destination.viewControllers[0] as? AccountManagementCollectionViewController{
                    viewContr.loggedIn = true
                    //print("segue result: \(viewContr.loggedIn)")

                }
            }
        }
    }


}


