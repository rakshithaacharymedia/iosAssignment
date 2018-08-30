//
//  ViewController.swift
//  scrollview2
//
//  Created by rakshitha on 28/08/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myscrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myscrollview.backgroundColor=UIColor.green
        let myimage=["FB.png","socialmedia.png","twitter.jpg","FB.png","socialmedia.png","twitter.jpg"]
        
        let imagewidth:CGFloat=275
        let imageheight:CGFloat=147
        var yposition:CGFloat=50
        var scrollviewcontentsize:CGFloat=0
        
        for i in myimage
        {
            let myimage:UIImage=UIImage(named:i)! //remove
            let myimageview:UIImageView=UIImageView()
            myimageview.image=myimage
            
            //setting the area where image has to be displayed
            
            myimageview.frame.size.width=imagewidth
            myimageview.frame.size.height=imageheight
            myimageview.contentMode = .scaleAspectFit
            myimageview.frame.origin.x=20
            myimageview.frame.origin.y=yposition
            
            myscrollview.addSubview(myimageview)
            
            yposition=yposition+imageheight+100
            scrollviewcontentsize+=imageheight
            
            //view.addSubview(myscrollview)
            
            myscrollview.contentSize=CGSize(width:imagewidth,height:yposition)   //????
            
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

