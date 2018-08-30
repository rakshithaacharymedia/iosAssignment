//
//  ViewController.swift
//  demooftableview
//
//  Created by rakshitha on 29/08/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var imagelist=["appliance","cosmetics","clothing","electronic","appliance","cosmetics","clothing","electronic"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imagelist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SecondTableViewCell
        cell.myimage.image=UIImage(named:imagelist[indexPath.row])
        cell.mylabel?.text=imagelist[indexPath.row]
        cell.mylabel2?.text="Browse"
        cell.backgroundColor=UIColor.yellow
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//         let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SecondTableViewCell
//         cell.backgroundColor=UIColor.yellow
        
        let currentCell = tableView.cellForRow(at: indexPath) as! SecondTableViewCell
        currentCell.backgroundColor=UIColor.red
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "SELECT ANY"
        label.backgroundColor =  UIColor.green
        label.textColor=UIColor.red
        label.textAlignment = .center
       return label
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "NEXT"
        label.backgroundColor =  UIColor.green
        label.textColor=UIColor.red
        label.textAlignment = .right
        return label
    }

   


}

