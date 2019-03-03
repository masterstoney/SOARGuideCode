//
//  ContentDataSource.swift
//  SOARGuide
//
//  Created by Tendaishe Gwini on 25/02/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit

class ContentDataSource: NSObject, UICollectionViewDataSource {
    
    //MARK: Properties
    
    private var data: [UIViewController] = [MainLabelViewController(),SignsViewController(),OptionsViewController()]
    
    
    
    //MARK: Datasource Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("Are you being called")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ContentCollectionViewCell
        cell.populateCell(vc: data[indexPath.row])
        return cell
    }
    
    
}
