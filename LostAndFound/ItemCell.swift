//
//  ItemCell.swift
//  LostAndFound
//
//  Created by 黄安怡 on 3/26/20.
//  Copyright © 2020 Anyi Huang. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell{
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var locationLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
        locationLabel.adjustsFontForContentSizeCategory = true
    }
}
