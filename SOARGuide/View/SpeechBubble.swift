//
//  SpeechBubble.swift
//  SOARGuide
//
//  Created by Tendaishe Gwini on 01/03/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit


/** View to display speech bubble pamphlet icon. Set up the size as a square */
class SpeechBubble: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        
        let strokeColor = #colorLiteral(red: 0.5803921569, green: 0.6941176471, blue: 0.7960784314, alpha: 1)
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.maxX, y: rect.midY + (rect.maxY / 8)))
        path.addLine(to: CGPoint(x: rect.maxX - (rect.maxX / 8), y: rect.midY))
        path.addArc(withCenter: CGPoint(x: rect.midX, y: rect.midY), radius: ((rect.maxX - (rect.maxX / 4)) / 2), startAngle: 0, endAngle: .pi/7.5, clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY + (rect.maxY / 8)))
        path.lineWidth = 1.0
        strokeColor.setStroke()
        path.stroke()
        drawIconCircle(rect: rect, currentSector: 0, lineWidth: 0.8, darkColor: #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), lightColor: #colorLiteral(red: 0.8352941176, green: 0.8352941176, blue: 0.8352941176, alpha: 1))
        drawIconCircle(rect: rect, currentSector: 0, lineWidth: 0.4, darkColor: #colorLiteral(red: 0.5647058824, green: 0.5647058824, blue: 0.5647058824, alpha: 1), lightColor: #colorLiteral(red: 0.8549019608, green: 0.8549019608, blue: 0.8549019608, alpha: 1))
        replicatorLayer.frame = rect
        squareLayer.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: 0.08 * rect.maxX, height: 0.06 * rect.maxY))
        squareLayer.position = CGPoint(x: 0.66 * rect.maxX, y: 0.808 * rect.maxY)
        
    }
    
    //MARK: Properties
    
    let replicatorLayer = CAReplicatorLayer()
    let squareLayer = CAShapeLayer()
    
    
    //MARK: View setup methods
    
    func setupView() {
        
        backgroundColor = .clear
        squareLayer.backgroundColor = #colorLiteral(red: 0.7960784314, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        squareLayer.cornerRadius = 3
        squareLayer.transform = CATransform3DMakeRotation(1.08, 0, 0, 1)
        replicatorLayer.addSublayer(squareLayer)
        replicatorLayer.instanceCount = 4
        let angle: CGFloat = .pi / 2
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1)
        layer.addSublayer(replicatorLayer)
        
    }
    
    
    func drawIconCircle(rect: CGRect, currentSector: Int, lineWidth: CGFloat, darkColor: UIColor, lightColor: UIColor) {
        
        if currentSector == 8 {
            return
        }
        let path = UIBezierPath()
        let radius: CGFloat = ((rect.maxX - (rect.maxX / 2)) / 2)
        let currentAngle: CGFloat = CGFloat(currentSector) * (CGFloat.pi / 4)
        let strokeColor: UIColor = (currentSector % 2 == 0 ? darkColor : lightColor)
        path.addArc(withCenter: CGPoint(x: rect.midX, y: rect.midY), radius: radius, startAngle: currentAngle, endAngle: (currentAngle + (.pi / 4)), clockwise: true)
        strokeColor.setStroke()
        path.lineWidth = lineWidth * radius
        path.stroke()
        drawIconCircle(rect: rect, currentSector: currentSector + 1, lineWidth: lineWidth, darkColor: darkColor, lightColor: lightColor)
        
    }
    
}
