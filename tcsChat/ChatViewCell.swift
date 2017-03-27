//
//  ChatViewCell.swift
//  tcsChat
//
//  Created by Филипп Дюдин on 27.03.17.
//  Copyright © 2017 Филипп Дюдин. All rights reserved.
//

import UIKit

class ChatViewCell: UITableViewCell {
    
    @IBOutlet weak var messagef: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
