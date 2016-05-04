//
//  TeacherListTableViewCell.swift
//  GDong
//
//  Created by JuanChen on 16/4/24.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class TeacherListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var teacherIcon: UIImageView!
    @IBOutlet weak var teacherName: UILabel!
    @IBOutlet weak var teacherIntroduction: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
