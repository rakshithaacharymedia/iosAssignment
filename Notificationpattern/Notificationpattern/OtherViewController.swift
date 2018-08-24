//
//  OtherViewController.swift
//  Notificationpattern
//
//  Created by rakshitha on 24/08/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit

class OtherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "socialmedia.png")!)
    }

   

    
     @IBAction func buttonfacebook(_ sender: UIButton) {
        
        NotificationCenter.default.post(name:.Facebook,object: nil)
     }
    
    @IBAction func buttontwitter(_ sender: Any) {
        
        NotificationCenter.default.post(name:.Twitter,object: nil)
        
    }
}


