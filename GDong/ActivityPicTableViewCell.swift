//
//  ActivityPicTableViewCell.swift
//  GDong
//
//  Created by JuanChen on 16/4/12.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class ActivityPicTableViewCell: UITableViewCell, UIScrollViewDelegate {
    
    //@IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var activityTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print(self.frame.size.width)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
