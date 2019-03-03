//
//  MainLabelViewController.swift
//  SOARGuide
//
//  Created by Tendaishe Gwini on 26/02/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit

class MainLabelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        setupViews()
    }
    
    //MARK: Properties
    
    private let speechBubble: SpeechBubble = {
        let view = SpeechBubble(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //MARK: Methods
    
    
    private func setupViews() {
        
        
        
        speechBubble.widthAnchor.constraint(equalToConstant: view.frame.width * 0.8).isActive = true
        speechBubble.heightAnchor.constraint(equalTo: speechBubble.widthAnchor, multiplier: 1.0).isActive = true
        view.addSubview(speechBubble)
        speechBubble.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        speechBubble.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -30).isActive = true
        
        
        
        
    }
    
    
}
