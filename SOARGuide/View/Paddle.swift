//
//  Paddle.swift
//  SOARGuide
//
//  Created by Tendaishe Gwini on 03/03/2019.
//  Copyright © 2019 Tendaishe Gwini. All rights reserved.
//

import UIKit

enum PaddleType {
    case yes
    case no
}


class PaddleView: UIView {
    
    //MARK: Draw function
    
    override func draw(_ rect: CGRect) {
        
        handle.frame = CGRect(x: 0, y: rect.midY - (0.05 * rect.maxY), width: rect.midX, height: 0.1 * rect.maxY)
        connector.frame = CGRect(x: rect.midX, y: rect.midY - (0.075 * rect.maxY), width: (0.05 * rect.maxY), height: (0.15 * rect.maxY))
        text.frame = CGRect(x: rect.midX + (0.125 * rect.maxX), y: rect.midY - (0.25 * rect.maxY), width: 0.18 * rect.maxX, height: 0.4 * rect.maxY)
        
        
        let strokeColor = #colorLiteral(red: 0.862745098, green: 0.862745098, blue: 0.862745098, alpha: 1)
        let board = UIBezierPath()
        board.move(to: CGPoint(x: connector.frame.maxX, y: handle.frame.minY))
        board.addCurve(to: CGPoint(x: board.currentPoint.x + (0.175 * rect.maxX), y: board.currentPoint.y - (0.3 * rect.maxY)), controlPoint1: CGPoint(x: board.currentPoint.x + (0.05 * rect.maxX), y: board.currentPoint.y), controlPoint2: CGPoint(x: board.currentPoint.x + (0.075 * rect.maxX), y: board.currentPoint.y - (0.3 * rect.maxY)))
        board.addLine(to: CGPoint(x: board.currentPoint.x + (0.0625 * rect.maxX), y: board.currentPoint.y))
        board.addQuadCurve(to: CGPoint(x: board.currentPoint.x + (0.075 * rect.maxX), y: board.currentPoint.y + (0.3 * rect.maxY)), controlPoint: CGPoint(x: board.currentPoint.x + (0.0625 * rect.maxX), y: board.currentPoint.y))
        board.addQuadCurve(to: CGPoint(x: board.currentPoint.x - (0.075 * rect.maxX), y: board.currentPoint.y + (0.3 * rect.maxY)), controlPoint: CGPoint(x: board.currentPoint.x + (0.0125 * rect.maxX), y: board.currentPoint.y + (0.3 * rect.maxY)))
        board.addLine(to: CGPoint(x: board.currentPoint.x - (0.0625 * rect.maxX), y: board.currentPoint.y))
        board.addCurve(to: CGPoint(x: board.currentPoint.x - (0.175 * rect.maxX), y: handle.frame.maxY), controlPoint1: CGPoint(x: board.currentPoint.x - (0.1 * rect.maxX), y: board.currentPoint.y), controlPoint2: CGPoint(x: board.currentPoint.x - (0.1375 * rect.maxX), y: handle.frame.maxY))
        board.close()
        paddleBoard.path = board.cgPath
        paddleBoard.fillColor = strokeColor.cgColor
        
    }
    
    //MARK: Properties
    
    let connector = CAShapeLayer()
    let handle = CAShapeLayer()
    let paddleBoard = CAShapeLayer()
    let text = CATextLayer()
    
    //MARK: Init methods
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(type: PaddleType) {
        self.init()
        
        if type == .yes {
            transform = CGAffineTransform(rotationAngle: .pi)
            text.transform = CATransform3DMakeRotation(.pi, 0, 0, 1)
            text.string = "YES"
        }
    }
    
    
    //MARK: View Setup Methods
    
    func setupView() {
        
        handle.backgroundColor = #colorLiteral(red: 0.6274509804, green: 0.6352941176, blue: 0.6431372549, alpha: 1)
        handle.contentsScale = UIScreen.main.scale
        layer.addSublayer(handle)
        
        
        connector.cornerRadius = 2
        connector.backgroundColor = #colorLiteral(red: 0.568627451, green: 0.5843137255, blue: 0.5960784314, alpha: 1)
        connector.contentsScale = UIScreen.main.scale
        layer.addSublayer(connector)
        
        text.string = "NO"
        text.foregroundColor = #colorLiteral(red: 0.6705882353, green: 0.6705882353, blue: 0.6705882353, alpha: 1)
        text.contentsScale = UIScreen.main.scale
        text.alignmentMode = .center
        paddleBoard.addSublayer(text)
        
        paddleBoard.contentsScale = UIScreen.main.scale
        layer.addSublayer(paddleBoard)
        
    }
    
}
