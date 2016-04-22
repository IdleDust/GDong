//
//  TeacherIntroTitleTableViewCell.swift
//  GDong
//
//  Created by JuanChen on 16/4/21.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class TeacherIntroTitleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var teacherIntroIcon: UIImageView!
    @IBOutlet weak var teacherIntroTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
