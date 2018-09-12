//
//  SelectOptionViewController.swift
//  EmployeeSampleData
//
//  Created by rakshitha on 12/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit

class SelectOptionViewController: UIViewController {

  
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func viewWillAppear(_ animated: Bool) {
        button1.layer.cornerRadius = 10
        button1.layer.borderWidth = 2
        
        
        button2.layer.cornerRadius = 10
        button2.layer.borderWidth = 2
       
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
