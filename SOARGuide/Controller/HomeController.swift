//
//  ViewController.swift
//  SOARGuide
//
//  Created by Tendaishe Gwini on 25/02/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 //       view.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        setupViews()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }

    
    //MARK: Properties
    
    private lazy var contentCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: myLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        collectionView.register(ContentCollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return collectionView
    }()
    
    private var dataSource = ContentDataSource()
    
    //MARK: Methods
    
    private func setupViews() {
        
        view.addSubview(contentCollectionView)
        contentCollectionView.constrainToSuper()
        
        
//        contentCollectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        contentCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        contentCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        contentCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    
    private func myLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: view.frame.width, height: 1.0)
    //    layout.itemSize = CGSize(width: view.frame.width, height: 50)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets.init(top: -50, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        return layout
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 1.0)
    }
    
    
    
    
    

}

