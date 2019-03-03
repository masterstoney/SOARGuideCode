//
//  OptionsViewController.swift
//  SOARGuide
//
//  Created by Tendaishe Gwini on 26/02/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 600).isActive = true
        setupView()
    }
    

    //MARK: Properties
    
    private let noPaddle: PaddleView = {
        let paddle = PaddleView(type: .no)
        paddle.translatesAutoresizingMaskIntoConstraints = false
        return paddle
    }()
    
    //MARK: Methods
    
    private func setupView() {
        
        
        noPaddle.heightAnchor.constraint(equalToConstant: 100).isActive = true
        noPaddle.widthAnchor.constraint(equalToConstant: 400).isActive = true
        view.addSubview(noPaddle)
        noPaddle.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        noPaddle.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        
        
    }
    
    
    
    
    
    
    

}
