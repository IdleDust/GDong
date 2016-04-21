//
//  CommentTableViewCell.swift
//  GDong
//
//  Created by JuanChen on 16/4/20.
//  Copyright © 2016年 JuanChen. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var commentTableViewCellUserPic: UIImageView!
    @IBOutlet weak var commentTableViewCellUserName: UILabel!
    @IBOutlet weak var commentTableViewCellUserComment: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
