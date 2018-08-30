//
//  SecondViewController.swift
//  scrollview2
//
//  Created by rakshitha on 28/08/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UIScrollViewDelegate {
   
    @IBOutlet weak var myimage: UIImageView!
    @IBOutlet weak var myscrollview: UIScrollView!
    
    @IBOutlet weak var mylabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let mimage=UIImage(named:"frog.jpg")
        myimage.image=mimage
    
        
        self.myscrollview.minimumZoomScale=1.0
        self.myscrollview.maximumZoomScale=6.0
        
        
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        //return self.myimage    //????????
        return self.mylabel

    }

    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
}
    
    
    
    

