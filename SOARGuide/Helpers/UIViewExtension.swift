//
//  UIViewExtension.swift
//  SOARGuide
//
//  Created by Tendaishe Gwini on 26/02/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit

extension UIView {
    
    /** Method constrains view to all edges of superview */
    func constrainToSuper() {
        
        if let superview = self.superview {
            self.topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
        }
    }
    
}

