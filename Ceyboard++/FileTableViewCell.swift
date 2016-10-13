//
//  FileTableViewCell.swift
//  Ceyboard++
//
//  Created by Brennan Zimmer on 10/8/16.
//  Copyright © 2016 Brennan Zimmer. All rights reserved.
//

import UIKit

class FileTableViewCell: UITableViewCell {

    
    @IBOutlet weak var fileNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
