//
//  VersionSettingTableViewCell.swift
//  GDong
//
//  Created by JuanChen on 16/5/19.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class VersionSettingTableViewCell: UITableViewCell {

    
    @IBOutlet weak var versionTitle: UILabel!
    @IBOutlet weak var appVersion: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
