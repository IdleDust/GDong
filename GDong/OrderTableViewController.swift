//
//  OrderTableViewController.swift
//  GDong
//
//  Created by JuanChen on 16/4/26.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class OrderTableViewController: UITableViewController {
    
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var numOfOrders: UILabel!
    
    @IBOutlet weak var contactName: UITextField!
    @IBOutlet weak var contactPhone: UITextField!
    
    @IBOutlet weak var childName: UITextField!
    @IBOutlet weak var childBirthYearAndMonth: UITextField!
    @IBOutlet weak var childSexType: UITextField!
    
    @IBOutlet weak var wechatSelected: UIButton!
    @IBOutlet weak var alipaySelected: UIButton!
    
    //bottom barbuttonitem
    
    @IBOutlet weak var totalBarButton: UIBarButtonItem!
    @IBOutlet weak var totalPriceBarButton: UIBarButtonItem!
    @IBOutlet weak var payBarButton: UIBarButtonItem!
    
    
    var countNumOfOrders = 0
    //paymentMethod "0-not select, 1-select wechat, 2-select Alipay"
    var paymentMethod = 0
    
    //Mark - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        self.navigationController?.setToolbarHidden(false, animated: true)
        
        let gestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(OrderTableViewController.hideKeyboard))
        gestureRecognizer.cancelsTouchesInView = false
        self.tableView.addGestureRecognizer(gestureRecognizer)
        customBarbuttonitem()
        let price:Float = 1000.00
        totalPriceBarButton(price)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        contactName.borderStyle = UITextBorderStyle.none
        contactPhone.borderStyle = UITextBorderStyle.none
        childName.borderStyle = UITextBorderStyle.none
        childBirthYearAndMonth.borderStyle = UITextBorderStyle.none
        childSexType.borderStyle = UITextBorderStyle.none
        
        numOfOrders.layer.borderColor = Lib.customColor.cgColor
        numOfOrders.layer.borderWidth = 2.0
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark - Delegate
    
    /*auto height for table view cell*/
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 500
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    //* - Custom Footer For Each Section */
    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let footer:UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        footer.contentView.backgroundColor = UIColor.lightGray
        footer.alpha = 0.2
        footer.textLabel!.text = ""
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(10)
    }


    //Mark - Event response
    @IBAction func minusOrder(_ sender: AnyObject) {
        if(countNumOfOrders > 0){
            countNumOfOrders = countNumOfOrders - 1
            numOfOrders.text = String(countNumOfOrders)
        }
        
    }
    
    @IBAction func plusOrders(_ sender: AnyObject) {
        countNumOfOrders = countNumOfOrders + 1
        numOfOrders.text = String(countNumOfOrders)
    }
    
    func hideKeyboard(){
        contactName.resignFirstResponder()
        contactPhone.resignFirstResponder()
        childName.resignFirstResponder()
        childBirthYearAndMonth.resignFirstResponder()
        childSexType.resignFirstResponder()
    }
    
    
    
    @IBAction func selectWechat(_ sender: AnyObject) {
        let checkedImage = UIImage(named: "checked")
        let uncheckedImage = UIImage(named: "unchecked")
        if((sender.isSelected) != nil){
            if(sender.isSelected == true){
                wechatSelected.setBackgroundImage(uncheckedImage, for: UIControlState())
                wechatSelected.isSelected = false
                if(alipaySelected.isSelected == true){
                    paymentMethod = 2
                } else {
                    paymentMethod = 0
                }
            } else {
                wechatSelected.setBackgroundImage(checkedImage, for: .selected)
                wechatSelected.isSelected = true
                paymentMethod = 1
                if(alipaySelected.isSelected == true){
                    alipaySelected.setBackgroundImage(uncheckedImage, for: UIControlState())
                    alipaySelected.isSelected = false
                }
            }
            print(paymentMethod)
        }
    }
    
    @IBAction func selectAlipay(_ sender: AnyObject) {
        let checkedImage = UIImage(named: "checked")
        let uncheckedImage = UIImage(named: "unchecked")
        
        if((sender.isSelected) != nil){
            if(sender.isSelected == true){
                alipaySelected.setBackgroundImage(uncheckedImage, for: UIControlState())
                alipaySelected.isSelected = false
                
                if(wechatSelected.isSelected == true){
                    paymentMethod = 1
                }else {
                    paymentMethod = 0
                }
            } else {
                alipaySelected.setBackgroundImage(checkedImage, for: .selected)
                alipaySelected.isSelected = true
                if(wechatSelected.isSelected == true){
                    wechatSelected.setBackgroundImage(uncheckedImage, for: UIControlState())
                    wechatSelected.isSelected = false
                }
                paymentMethod = 2
            }
            print(paymentMethod)
        }
        
        
    }
 
    func paySuccess(_ sender: AnyObject?) {
        performSegue(withIdentifier: "paySuccessed", sender: sender)
    }
    
    
    
    //Mark - private methods
    
    //Mark - getters and setters
    
    //set bottom barbuttonitem
    func totalPriceBarButton(_ price:Float){
        let priceButton:UIButton = UIButton()
        var totalPrice = NSString(format: "%.2f", price)
        totalPrice = (totalPrice as NSString)// + "元"
        priceButton.setTitle(totalPrice as String, for: UIControlState())
        priceButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        priceButton.setTitleColor(Lib.customColor, for: UIControlState())
        priceButton.frame = CGRect(x: 0, y: 0, width: 100, height: 35)
        
        totalPriceBarButton.customView = priceButton
    }
    
    func customBarbuttonitem(){
        let button:UIButton = UIButton()
        button.setTitle("总共:", for: UIControlState())
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.right
        button.setTitleColor(Lib.customColor, for: UIControlState())
        button.frame = CGRect(x: 0, y: 0, width: 56, height: 35)
        totalBarButton.customView = button
        
        let payButton:UIButton = UIButton()
        payButton.setTitle("支付", for: UIControlState())
        payButton.setTitleColor(UIColor.white, for: UIControlState())
        payButton.backgroundColor = Lib.customColor
        payButton.frame = CGRect(x: 0, y: 0, width: 100, height: 35)
        
        payButton.addTarget(self, action: #selector(OrderTableViewController.paySuccess), for: UIControlEvents.touchUpInside)
        payBarButton.customView = payButton
    }
    
    
    
    
    
    
   
}
