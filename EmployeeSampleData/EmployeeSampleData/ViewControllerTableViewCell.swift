//
//  ViewControllerTableViewCell.swift
//  EmployeeSampleData
//
//  Created by rakshitha on 05/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit

class ViewControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var mylabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
