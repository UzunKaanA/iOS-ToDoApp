//
//  ToDoTableViewCell.swift
//  ToDoApp
//
//  Created by Kaan Uzun on 18.05.2024.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
