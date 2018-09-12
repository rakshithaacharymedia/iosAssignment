//
//  DisplayTableViewCell.swift
//  EmployeeSampleData
//
//  Created by rakshitha on 05/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit

class DisplayTableViewCell: UITableViewCell {

    @IBOutlet weak var depLabel: UILabel!
    
    @IBOutlet weak var salarylabel: UILabel!
    @IBOutlet weak var addresslabel: UILabel!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var idlabel: UILabel!

   
      
        
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
