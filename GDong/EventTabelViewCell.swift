//
//  ActivityTableViewCell.swift
//  GDong
//
//  Created by JuanChen on 16/4/11.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eventIntroImage: UIImageView!
    
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventSubtitle: UILabel!
    @IBOutlet weak var eventPrice: UILabel!
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
