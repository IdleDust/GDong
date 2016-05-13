//
//  AccountManagementCollectionViewController.swift
//  GDong
//
//  Created by JuanChen on 16/5/11.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class AccountManagementCollectionViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    var screenWidth: CGFloat?
    var imageSet:[UIImage]?
    let imageDescription:[String] = ["活动日程", "订单管理", "消息", "邀请有礼", "优惠礼券", "报名信息", "我的收藏", "小秘书", "设置"]
    
    
    
    //Mark - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollectionView()
        navigationController?.navigationBar.barTintColor = Lib.darkerBlueColor
        self.view.backgroundColor = Lib.darkerBlueColor
        
    }
    
    
    
    //Mark - UICollectionView Delegate
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cellNumber = indexPath.row
        print(cellNumber)
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("gridCell", forIndexPath: indexPath) as! AccountManagementCollectionViewCell
        cell.cellImage.image = imageSet![cellNumber]
        cell.cellTitle.text = imageDescription[cellNumber]
        cell.layer.borderColor = UIColor.lightGrayColor().CGColor
        cell.layer.borderWidth = 1.0
        return cell
    }
    
    //set collectionview cell width and height
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let picDimension = self.view.frame.size.width / 3.0
        return CGSizeMake(picDimension, picDimension)
    }
    
    //set inset among collectionviewcell
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let leftRightInset = CGFloat(0)
        return UIEdgeInsetsMake(0, leftRightInset, 0, leftRightInset)
    }
    
    
    
    //Mark - Event response
    
    
    
    //Mark - private methods
    
    
    
    //Mark - getters and setters
    func initCollectionView(){
        screenWidth = self.view.frame.width
        collectionView.backgroundColor = UIColor.whiteColor()
        let imageTitle:[String] = ["calender", "order", "notification", "invitation", "coupon", "ID_card", "like", "secretary", "setting"]
        imageSet = [UIImage]()
        for i in 0..<9 {
            if let image = UIImage(named: imageTitle[i]) {
                imageSet?.append(image)
                print(imageTitle[i])
            }
        }
    }

    //MARK - Navigation Views
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let index = (indexPath.row)
        //collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        if(index == 0) {
           performSegueWithIdentifier("showCalenderSegue", sender: self)
        } else if (index == 1){
            performSegueWithIdentifier("showAllOrdersSegue", sender: self)
        }
        
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if  segue.identifier == "showCalenderSegue",
            let destination = segue.destinationViewController as? CalenderTableViewController,
            index = collectionView.indexPathsForSelectedItems()
        {
            print("index is: \(index[0].row)")
            destination.pageIndication = index[0].row
        }
    }
    
    
    
    
}
