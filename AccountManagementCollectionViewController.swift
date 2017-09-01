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
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    var screenWidth: CGFloat?
    var imageSet:[UIImage]?
    var loggedIn:Bool = false
    
    
    //Mark - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollectionView()
        navigationController?.navigationBar.barTintColor = Lib.darkerBlueColor
        self.view.backgroundColor = Lib.darkerBlueColor
        setUserLogStatus()
    }
    
    
    
    //Mark - UICollectionView Delegate
    func numberOfSectionsInCollectionView(_ collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAtIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        let cellNumber = (indexPath as NSIndexPath).row
        print(cellNumber)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gridCell", for: indexPath) as! AccountManagementCollectionViewCell
        cell.cellImage.image = imageSet![cellNumber]
        cell.cellTitle.text = Lib.pageName[cellNumber]
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 1.0
        return cell
    }
    
    //set collectionview cell width and height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        let picDimension = self.view.frame.size.width / 3.0
        return CGSize(width: picDimension, height: picDimension)
    }
    
    //set inset among collectionviewcell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let leftRightInset = CGFloat(0)
        return UIEdgeInsetsMake(0, leftRightInset, 0, leftRightInset)
    }
    
    
    
    //Mark - Event response
    
    //Mark - private methods
    
    //Mark - getters and setters
    func initCollectionView(){
        screenWidth = self.view.frame.width
        collectionView.backgroundColor = UIColor.white
        let imageTitle:[String] = ["calender", "order", "notification", "invitation", "coupon", "ID_card", "like", "secretary", "setting"]
        imageSet = [UIImage]()
        for i in 0..<9 {
            if let image = UIImage(named: imageTitle[i]) {
                imageSet?.append(image)
                print(imageTitle[i])
            }
        }
    }
    
    func setUserLogStatus(){
        if(!loggedIn) {
            userName.text = "未登录"
            userImage.image = UIImage(named: "user_background.jpeg")
        }
    }

    //MARK - Navigation Views
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if(loggedIn){
        
            let index = ((indexPath as NSIndexPath).row)
            //collectionView.deselectItemAtIndexPath(indexPath, animated: true)
            if(index == 0) {
               performSegue(withIdentifier: "showCalenderSegue", sender: self)
            } else if (index == 1){
                performSegue(withIdentifier: "showAllOrdersSegue", sender: self)
            }
            else if (index == 2) {
                performSegue(withIdentifier: "showMessagesSegue", sender: self)
            }
            else if (index == 5) {
                performSegue(withIdentifier: "showProfileSegue", sender: self)
            }else if (index == 8) {
                performSegue(withIdentifier: "showSettingSegue", sender: self)
            }
        }
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "showCalenderSegue",
            let destination = segue.destination as? CalenderTableViewController,
            let index = collectionView.indexPathsForSelectedItems
        {
            print("index is: \((index[0] as NSIndexPath).row)")
            //destination.pageIndication = index[0].row
        }
    }
    
    
    
    
}
