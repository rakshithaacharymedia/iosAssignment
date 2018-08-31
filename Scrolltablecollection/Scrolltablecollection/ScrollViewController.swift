//
//  ScrollViewController.swift
//  Scrolltablecollection
//
//  Created by rakshitha on 31/08/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController,UIScrollViewDelegate {

    
    @IBOutlet weak var myimage: UIImageView!
    @IBOutlet weak var mylabel: UILabel!
    @IBOutlet weak var myscrollview: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mimage=UIImage(named:"FB.jpg")
        myimage.image=mimage
        self.myscrollview.minimumZoomScale=1.0
        self.myscrollview.maximumZoomScale=6.0
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.myimage    //????????
      //  return self.mylabel
    }
    
    
    


}
