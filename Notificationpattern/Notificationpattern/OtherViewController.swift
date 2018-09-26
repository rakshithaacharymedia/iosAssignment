//
//  OtherViewController.swift
//  Notificationpattern
//
//  Created by rakshitha on 24/08/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//


protocol display {
    func sendData(str:String)
}
import UIKit

typealias v2CB = (_ infoToReturn :String) ->()
class OtherViewController: UIViewController {
     var forclosure:v2CB?
    var delegate:display?
    override func viewDidLoad() {
        super.viewDidLoad()
      //testing
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "socialmedia.png")!)
    }

   
    @IBAction func buttonWhatsapp(_ sender: Any) {
        
        forclosure!("whatsapp")
    }
    
    
     @IBAction func buttonfacebook(_ sender: UIButton) {
        
        NotificationCenter.default.post(name:.Facebook,object: nil)
     }
    
    @IBAction func buttontwitter(_ sender: Any) {
    
        if delegate != nil{
              delegate?.sendData(str: "twitter")
        }

        
    }
}



