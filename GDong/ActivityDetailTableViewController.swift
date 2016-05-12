//
//  EventDetailTableViewController.swift
//  GDong
//
//  Created by JuanChen on 16/4/11.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class ActivityDetailTableViewController: UITableViewController{
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var activityDetailTitle: UILabel!
    @IBOutlet var activityDetailTableView: UITableView!
    
    
    @IBOutlet weak var leftBarButton: UIBarButtonItem!

    @IBOutlet weak var rightBarButton: UIBarButtonItem!
    
    //MARK: variables for section0: show images in scrollview with pagecontrol
    var images:[UIImage] = []
    var imageframe: CGRect = CGRectMake(0, 0, 0, 0)
    var pageControl:UIPageControl?
    
    
    //MARK - adjust cell height automatically
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }


    //Mark - life cycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setToolbarHidden(false, animated: true)
        print("viewdidload")
        loadImage()
        configureTableView()
        scrollView.delegate = self
        addImageViewToScrollView()
        
        let width = self.view.frame.width
        let ratio = CGFloat(468/750.0)
        pageControl = UIPageControl(frame: CGRectMake(0, width*ratio-20, width, 20))
        configurePageControl()
        self.view.addSubview(pageControl!)
        customBarbuttonitem()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewDidAppear(animated: Bool) {
        print("viewDidAppear")
        pageControl!.addTarget(self, action: #selector(ActivityDetailTableViewController.changePage(_:)), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setToolbarHidden(true, animated: true)
        
    }
    
    // MARK: BRING PAGECONTROL TO FRONT
    override func viewDidLayoutSubviews() {
        for subView in self.view.subviews {
            if subView is UIPageControl {
                self.view.bringSubviewToFront(subView)
            }
        }
        super.viewDidLayoutSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //Mark - UITableViewDelegate
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    //MARK - Custom Footer For Each Section
    override func tableView(tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let footer:UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        footer.contentView.backgroundColor = UIColor.lightGrayColor()
        footer.alpha = 0.2
        footer.textLabel!.text = ""
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(10)
    }
    
    //MARK: UISCROLLVIEWDELEGATE
    
    
    override func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        //print("Scroll view did end decelerating")
        let view = self.view.viewWithTag(101)
        if(scrollView == view){
            let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
            pageControl!.currentPage = Int(pageNumber)
        }
    }

    //Mark - Event response
    
    
    func changePage(sender: AnyObject) -> () {
        //print("Change page")
        let x = CGFloat(pageControl!.currentPage) * self.view.frame.size.width
        print(x)
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
    }
    
    func toSignUp(sender: AnyObject?){
        performSegueWithIdentifier("toSignUp", sender: sender)
    }
    
    

    //Mark - private methods
    
    
    func loadImage(){
        for i in 1..<7 {
            let name = "page" + String(i)
            let image = UIImage(named: name)
            images.append(image!)
        }
    }
    
    func configurePageControl() {
        self.pageControl!.numberOfPages = images.count
        self.pageControl!.currentPage = 0
        self.pageControl!.backgroundColor = UIColor(red: 99/255.0, green: 213/255.0, blue: 211/255.0, alpha: 0)
        self.pageControl!.pageIndicatorTintColor = UIColor.whiteColor()
        self.pageControl!.currentPageIndicatorTintColor = Lib.customColor
    }
    
    func addImageViewToScrollView() {
        
        let width = self.view.frame.width
        let ratio = CGFloat(468/750.0)
        
        for index in 0..<images.count {
            imageframe.origin.x = width * CGFloat(index)
            let frame = CGRectMake(0, 0, width, width * ratio)
            imageframe.size = frame.size
            scrollView.pagingEnabled = true
            
            let imageSubView = UIImageView(frame: imageframe)
            imageSubView.image = images[index]
            imageSubView.contentMode = UIViewContentMode.ScaleAspectFill
            scrollView.addSubview(imageSubView)
        }
        scrollView.contentSize = CGSizeMake(width * CGFloat(images.count), width*ratio)
    }

    //Mark - getters and setters
    
    
    //set bottom barbuttonitem    
    func customBarbuttonitem(){
        
        let button:UIButton = UIButton()
        button.setTitle("109元/2人", forState: .Normal)
        button.setTitleColor(Lib.customColor, forState: .Normal)
        button.frame = CGRectMake(0, 0, 100, 35)
        leftBarButton.customView = button
        
        let signUpButton:UIButton = UIButton()
        signUpButton.setTitle("立即报名", forState: .Normal)
        signUpButton.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        signUpButton.backgroundColor = Lib.customColor
        signUpButton.frame = CGRectMake(0, 0, 125, 35)
        signUpButton.addTarget(self, action: #selector(ActivityDetailTableViewController.toSignUp), forControlEvents: UIControlEvents.TouchUpInside)
        rightBarButton.customView = signUpButton
    }

}
