//
//  MessageTableViewCell.swift
//  GDong
//
//  Created by JuanChen on 16/5/13.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    
    @IBOutlet weak var messageContent: UILabel!
    
    @IBOutlet weak var messageTime: UILabel!
    @IBOutlet weak var messageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
