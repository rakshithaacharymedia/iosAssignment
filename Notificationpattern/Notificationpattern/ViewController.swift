//
//  ViewController.swift
//  Notificationpattern
//
//  Created by rakshitha on 24/08/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit

class ViewController: UIViewController,display {
    

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(facebook(notification:)) , name: .Facebook, object: nil)
       
    }
    func todisplay(mystrings:String)
    {
        let mystring:String!=mystrings
        let multipleattribute:[NSAttributedStringKey:Any]=[
            NSAttributedStringKey.font:UIFont(name:"chalkduster",size:40)!,
            NSAttributedStringKey.backgroundColor:UIColor.yellow,
        NSAttributedStringKey.strokeWidth:2,
           // NSAttributedStringKey.strokeColor:UIColor.black,
            NSAttributedStringKey.foregroundColor:UIColor.red]
        
        let mystring2=NSAttributedString(string:mystring,attributes:multipleattribute)
        label.attributedText=mystring2
        
    }
    @objc func facebook(notification:Notification)
    {
         todisplay(mystrings: "facebook")
        img.image=#imageLiteral(resourceName: "facebook")
    }
    
    
    @IBAction func buttonclick(_ sender: Any) {
        
        let secondvc=self.storyboard?.instantiateViewController(withIdentifier:"OtherViewController") as! OtherViewController
        secondvc.delegate=self
        secondvc.forclosure={(str)->() in
            self.todisplay(mystrings: str)
            self.img.image=#imageLiteral(resourceName: "whatsapp")
            
        }
        self.navigationController?.pushViewController(secondvc, animated: true)
    }
    
    func sendData(str: String) {
        todisplay(mystrings: str)
        img.image=UIImage(named:str)
    }
}
    
    extension Notification.Name{
        static let Facebook=Notification.Name("Facebook")
        
    }

