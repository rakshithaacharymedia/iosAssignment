//
//  ViewController.swift
//  Collectionviewprogram
//
//  Created by rakshitha on 30/08/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource{
    
    let arrays=["FB","twitter","frog","socialmedia"]
    var collectionView:UICollectionView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //cant initialize uicollectionview without a layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset=UIEdgeInsets(top:20,left:10,bottom:10,right:10)
        layout.itemSize=CGSize(width:90,height:150)
        
        //initialize collection view
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        
        //collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")  //???????
        collectionView?.register(UINib.init(nibName:String(describing:SecondCollectionViewCell.self),bundle:Bundle.main), forCellWithReuseIdentifier: "cell")
        collectionView?.backgroundColor = UIColor.white
        self.view.addSubview(collectionView!)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrays.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SecondCollectionViewCell
        {
            cell.myimage.image=UIImage(named:arrays[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

