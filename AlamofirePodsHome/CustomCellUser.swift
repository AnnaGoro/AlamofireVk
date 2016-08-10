

import UIKit

class CustomCellUser: UITableViewCell {
    
    
    @IBOutlet weak var thumbNailImageView: UIImageView!
    
    @IBOutlet weak var bDateLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
