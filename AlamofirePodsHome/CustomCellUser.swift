//
//  CustomCellUser.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 8/3/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import UIKit

class CustomCellUser: UITableViewCell {
    
    @IBOutlet weak var thumbNailImageView: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var bDateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
