//
//  CalenderTableViewCell.swift
//  GDong
//
//  Created by JuanChen on 16/5/12.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class CalenderTableViewCell: UITableViewCell {

    @IBOutlet weak var helpView: UIView!
    @IBOutlet weak var activityTitle: UILabel!
    
    @IBOutlet weak var activitySubtitle: UILabel!
    @IBOutlet weak var activityImage: UIImageView!
    @IBOutlet weak var numberOfOrders: UILabel!
    @IBOutlet weak var orderCode: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
