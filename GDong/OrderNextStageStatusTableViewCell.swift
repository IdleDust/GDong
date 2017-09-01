//
//  OrderNextStageStatusTableViewCell.swift
//  GDong
//
//  Created by JuanChen on 16/5/13.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class OrderNextStageStatusTableViewCell: UITableViewCell {

    @IBOutlet weak var orderPaidAmout : UILabel!
    @IBOutlet weak var orderNextStageButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
