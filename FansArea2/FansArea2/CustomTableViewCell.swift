//
//  CustomTableViewCell.swift
//  FansArea2
//
//  Created by Talk GoGo on 2017/8/7.
//  Copyright © 2017年 Talk GoGo. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partLabel: UILabel!

    @IBOutlet weak var provinceLabel: UILabel!
    
    @IBOutlet weak var thumbImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
