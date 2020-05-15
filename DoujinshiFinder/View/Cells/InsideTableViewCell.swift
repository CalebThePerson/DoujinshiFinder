//
//  InsideTableViewCell.swift
//  DoujinshiFinder
//
//  Created by Caleb Wheeler on 5/12/20.
//  Copyright © 2020 Caleb Wheeler. All rights reserved.
//

import UIKit

class InsideTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var TheName: UILabel!
    @IBOutlet weak var SauceNumbers: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
