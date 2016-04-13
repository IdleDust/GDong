//
//  ActivityTableViewCell.swift
//  GDong
//
//  Created by JuanChen on 16/4/11.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var activityIntroImage: UIImageView!
    
    @IBOutlet weak var activityTitle: UILabel!
    @IBOutlet weak var activitySubtitle: UILabel!
    @IBOutlet weak var activityPrice: UILabel!
    @IBOutlet weak var postedBy: UIImageView!
    @IBOutlet weak var totalSignedUp: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
