//
//  ViewController.swift
//  Notificationpattern
//
//  Created by rakshitha on 24/08/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(facebook(notification:)) , name: .Facebook, object: nil)
       NotificationCenter.default.addObserver(self, selector: #selector(twitter(notification:)) , name: .Twitter, object: nil)
        
    }
    func todisplay(mystrings:String)
    {
        let mystring:String!=mystrings
        let multipleattribute:[NSAttributedStringKey:Any]=[
            NSAttributedStringKey.font:UIFont(name:"chalkduster",size:40),
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
    @objc func twitter(notification:Notification)
    {
        todisplay(mystrings: "twitter")
        img.image=#imageLiteral(resourceName: "twitter")
    }
    
    @IBAction func buttonclick(_ sender: Any) {
        
        let secondvc=self.storyboard?.instantiateViewController(withIdentifier:"OtherViewController") as! OtherViewController
        self.navigationController?.pushViewController(secondvc, animated: true)
    }
}
    extension Notification.Name{
        static let Facebook=Notification.Name("Facebook")
        static let Twitter=Notification.Name("Twitter")
    }

