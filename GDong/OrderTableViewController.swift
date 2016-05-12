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
    
    override func viewWillAppear(animated: Bool) {
        
        contactName.borderStyle = UITextBorderStyle.None
        contactPhone.borderStyle = UITextBorderStyle.None
        childName.borderStyle = UITextBorderStyle.None
        childBirthYearAndMonth.borderStyle = UITextBorderStyle.None
        childSexType.borderStyle = UITextBorderStyle.None
        
        numOfOrders.layer.borderColor = Lib.customColor.CGColor
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
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    //* - Custom Footer For Each Section */
    override func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let footer:UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        footer.contentView.backgroundColor = UIColor.lightGrayColor()
        footer.alpha = 0.2
        footer.textLabel!.text = ""
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(10)
    }


    //Mark - Event response
    @IBAction func minusOrder(sender: AnyObject) {
        if(countNumOfOrders > 0){
            countNumOfOrders = countNumOfOrders - 1
            numOfOrders.text = String(countNumOfOrders)
        }
        
    }
    
    @IBAction func plusOrders(sender: AnyObject) {
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
    
    
    
    @IBAction func selectWechat(sender: AnyObject) {
        let checkedImage = UIImage(named: "checked")
        let uncheckedImage = UIImage(named: "unchecked")
        if((sender.selected) != nil){
            if(sender.selected == true){
                wechatSelected.setBackgroundImage(uncheckedImage, forState: .Normal)
                wechatSelected.selected = false
                if(alipaySelected.selected == true){
                    paymentMethod = 2
                } else {
                    paymentMethod = 0
                }
            } else {
                wechatSelected.setBackgroundImage(checkedImage, forState: .Selected)
                wechatSelected.selected = true
                paymentMethod = 1
                if(alipaySelected.selected == true){
                    alipaySelected.setBackgroundImage(uncheckedImage, forState: .Normal)
                    alipaySelected.selected = false
                }
            }
            print(paymentMethod)
        }
    }
    
    @IBAction func selectAlipay(sender: AnyObject) {
        let checkedImage = UIImage(named: "checked")
        let uncheckedImage = UIImage(named: "unchecked")
        
        if((sender.selected) != nil){
            if(sender.selected == true){
                alipaySelected.setBackgroundImage(uncheckedImage, forState: .Normal)
                alipaySelected.selected = false
                
                if(wechatSelected.selected == true){
                    paymentMethod = 1
                }else {
                    paymentMethod = 0
                }
            } else {
                alipaySelected.setBackgroundImage(checkedImage, forState: .Selected)
                alipaySelected.selected = true
                if(wechatSelected.selected == true){
                    wechatSelected.setBackgroundImage(uncheckedImage, forState: .Normal)
                    wechatSelected.selected = false
                }
                paymentMethod = 2
            }
            print(paymentMethod)
        }
        
        
    }
 
    func paySuccess(sender: AnyObject?) {
        performSegueWithIdentifier("paySuccessed", sender: sender)
    }
    
    
    
    //Mark - private methods
    
    //Mark - getters and setters
    
    //set bottom barbuttonitem
    func totalPriceBarButton(price:Float){
        let priceButton:UIButton = UIButton()
        var totalPrice = NSString(format: "%.2f", price)
        totalPrice = (totalPrice as String) + "元"
        priceButton.setTitle(totalPrice as String, forState: .Normal)
        priceButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        priceButton.setTitleColor(Lib.customColor, forState: .Normal)
        priceButton.frame = CGRectMake(0, 0, 100, 35)
        
        totalPriceBarButton.customView = priceButton
    }
    
    func customBarbuttonitem(){
        let button:UIButton = UIButton()
        button.setTitle("总共:", forState: .Normal)
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Right
        button.setTitleColor(Lib.customColor, forState: .Normal)
        button.frame = CGRectMake(0, 0, 56, 35)
        totalBarButton.customView = button
        
        let payButton:UIButton = UIButton()
        payButton.setTitle("支付", forState: .Normal)
        payButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        payButton.backgroundColor = Lib.customColor
        payButton.frame = CGRectMake(0, 0, 100, 35)
        
        payButton.addTarget(self, action: #selector(OrderTableViewController.paySuccess), forControlEvents: UIControlEvents.TouchUpInside)
        payBarButton.customView = payButton
    }
    
    
    
    
    
    
   
}
