//
//  TeamListCell.swift
//  LoginANDRegisterFORM
//
//  Created by Sopheap Sopheadavid on 7/23/19.
//  Copyright © 2019 Sopheap Sopheadavid. All rights reserved.
//

import UIKit

class TeamCell: UITableViewCell {
    
    @IBOutlet var labelName: UILabel!
    @IBOutlet var labelFullName: UILabel!
    @IBOutlet var labelAreaName: UILabel!
    @IBOutlet var labelCityName: UILabel!
    @IBOutlet var avatarImageView : UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
