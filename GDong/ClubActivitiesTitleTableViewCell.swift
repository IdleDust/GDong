//
//  ClubActivitiesTitleTableViewCell.swift
//  GDong
//
//  Created by JuanChen on 16/4/24.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class ClubActivitiesTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var clubActivityTitleIcon: UIImageView!
    
    @IBOutlet weak var clubActivityTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
