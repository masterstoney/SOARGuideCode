//
//  ContentCollectionViewCell.swift
//  SOARGuide
//
//  Created by Tendaishe Gwini on 26/02/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit

class ContentCollectionViewCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Methods
    
    func populateCell(vc: UIViewController) {
        
        addSubview(vc.view)
        vc.view.constrainToSuper()
        
    }
    
}
