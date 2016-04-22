//
//  ClubPhotoTableViewCell.swift
//  GDong
//
//  Created by JuanChen on 16/4/21.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class ClubPhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var clubPhoto: UIImageView!
    @IBOutlet weak var clubName: UILabel!
    @IBOutlet weak var clubSubName: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
