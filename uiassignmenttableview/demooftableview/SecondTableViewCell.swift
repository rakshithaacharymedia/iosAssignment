//
//  SecondTableViewCell.swift
//  demooftableview
//
//  Created by rakshitha on 29/08/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet weak var myheader: UILabel!
    @IBOutlet weak var mylabel2: UILabel!
    @IBOutlet weak var mylabel: UILabel!
    @IBOutlet weak var myimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
