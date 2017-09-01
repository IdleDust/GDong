//
//  OrderDetailTableViewCell.swift
//  GDong
//
//  Created by JuanChen on 16/5/13.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class OrderDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var orderEnrollTime: UILabel!
    
    @IBOutlet weak var orderImage: UIImageView!
    @IBOutlet weak var orderTitle: UILabel!
    @IBOutlet weak var orderStatus: UILabel!
    @IBOutlet weak var orderPrice: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
