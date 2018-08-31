//
//  SecondTableTableViewCell.swift
//  Scrolltablecollection
//
//  Created by rakshitha on 31/08/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit

class SecondTableTableViewCell: UITableViewCell {

    @IBOutlet weak var mylabel2: UILabel!
    @IBOutlet weak var myimage: UIImageView!
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
