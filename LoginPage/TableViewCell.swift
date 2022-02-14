//
//  TableViewCell.swift
//  LoginPage
//
//  Created by Buratsakorn Petchdee on 14/2/2565 BE.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var AccountNumber: UILabel!
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var Number: UILabel!
    
    @IBOutlet weak var Baht: UILabel!
    
    @IBOutlet weak var Price: UILabel!
    
    @IBOutlet weak var ImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
