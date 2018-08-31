//
//  ViewController.swift
//  demooftableview
//
//  Created by rakshitha on 29/08/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var table: UITableView?
    var imageList=["appliance","cosmetics","clothing","electronic","appliance","cosmetics","clothing","electronic"]
    override func viewDidLoad() {
        super.viewDidLoad()
      }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SecondTableTableViewCell
        {
        cell.myimage.image=UIImage(named:imageList[indexPath.row])
        cell.mylabel?.text=imageList[indexPath.row]
        cell.mylabel2?.text="Browse"
        cell.backgroundColor=UIColor.blue
        return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      if   let currentCell = tableView.cellForRow(at: indexPath) as? SecondTableTableViewCell
      {
        currentCell.backgroundColor=UIColor.red
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "FLIPKART"
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


