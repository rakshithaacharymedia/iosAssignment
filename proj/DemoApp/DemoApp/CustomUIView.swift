//
//  CustomUIView.swift
//  DemoApp
//
//  Created by rakshitha on 22/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit

class CustomUIView: UIView {

    @IBOutlet var view: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    {
        didSet{
            nameLabel.sizeToFit()
            }
    }
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeLabel: UILabel!{
        didSet{
            placeLabel.sizeToFit()
        }
    }
   
    @IBOutlet weak var directionButton: UIButton!{
    didSet{
        
          directionButton.layer.cornerRadius = 20
          directionButton.layer.borderWidth = 2
           directionButton.layer.borderColor = UIColor.white.cgColor
        
    }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
        Bundle.main.loadNibNamed("CustomUIView", owner: self, options: nil)
        view.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        self.addSubview(self.view)
    }
    
    @IBAction func DirectionButttonClicked(_ sender: Any)
    {
        print("button tapped")
        
    
    }
}
