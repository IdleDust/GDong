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
    var imageframe: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
    var pageControl:UIPageControl?
    
    
    //MARK - adjust cell height automatically
    func configureTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
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
        pageControl = UIPageControl(frame: CGRect(x: 0, y: width*ratio-20, width: width, height: 20))
        configurePageControl()
        self.view.addSubview(pageControl!)
        customBarbuttonitem()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        pageControl!.addTarget(self, action: #selector(ActivityDetailTableViewController.changePage(_:)), for: UIControlEvents.valueChanged)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setToolbarHidden(true, animated: true)
        
    }
    
    // MARK: BRING PAGECONTROL TO FRONT
    override func viewDidLayoutSubviews() {
        for subView in self.view.subviews {
            if subView is UIPageControl {
                self.view.bringSubview(toFront: subView)
            }
        }
        super.viewDidLayoutSubviews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    //Mark - UITableViewDelegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    //MARK - Custom Footer For Each Section
    override func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        let footer:UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView
        footer.contentView.backgroundColor = UIColor.lightGray
        footer.alpha = 0.2
        footer.textLabel!.text = ""
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat(10)
    }
    
    
    
    //MARK: UISCROLLVIEWDELEGATE
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //print("Scroll view did end decelerating")
        let view = self.view.viewWithTag(101)
        if(scrollView == view){
            let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
            pageControl!.currentPage = Int(pageNumber)
        }
    }

    //Mark - Event response
    func changePage(_ sender: AnyObject) -> () {
        //print("Change page")
        let x = CGFloat(pageControl!.currentPage) * self.view.frame.size.width
        print(x)
        scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
    
    func toSignUp(_ sender: AnyObject?){
        performSegue(withIdentifier: "toSignUp", sender: sender)
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
        self.pageControl!.pageIndicatorTintColor = UIColor.white
        self.pageControl!.currentPageIndicatorTintColor = Lib.customColor
    }
    
    func addImageViewToScrollView() {
        
        let width = self.view.frame.width
        let ratio = CGFloat(468/750.0)
        
        for index in 0..<images.count {
            imageframe.origin.x = width * CGFloat(index)
            let frame = CGRect(x: 0, y: 0, width: width, height: width * ratio)
            imageframe.size = frame.size
            scrollView.isPagingEnabled = true
            
            let imageSubView = UIImageView(frame: imageframe)
            imageSubView.image = images[index]
            imageSubView.contentMode = UIViewContentMode.scaleAspectFill
            scrollView.addSubview(imageSubView)
        }
        scrollView.contentSize = CGSize(width: width * CGFloat(images.count), height: width*ratio)
    }

    //Mark - getters and setters
    
    
    //set bottom barbuttonitem    
    func customBarbuttonitem(){
        
        let button:UIButton = UIButton()
        button.setTitle("109元/2人", for: UIControlState())
        button.setTitleColor(Lib.customColor, for: UIControlState())
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 35)
        leftBarButton.customView = button
        
        let signUpButton:UIButton = UIButton()
        signUpButton.setTitle("立即报名", for: UIControlState())
        signUpButton.setTitleColor(UIColor.white, for: UIControlState())
        signUpButton.backgroundColor = Lib.customColor
        signUpButton.frame = CGRect(x: 0, y: 0, width: 125, height: 35)
        signUpButton.addTarget(self, action: #selector(ActivityDetailTableViewController.toSignUp), for: UIControlEvents.touchUpInside)
        rightBarButton.customView = signUpButton
    }

}
