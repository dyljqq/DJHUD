//
//  DJHUDCheckMarkView.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/23.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

public class DJHUDCheckMarkView: DJHUDBaseView {
    
    private struct Constant {
        static let keyPath = "CheckMarkKeyFrameAnimation"
    }
    
    var checkMarkLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(4.0, 27.0))
        path.addLineToPoint(CGPointMake(34.0, 56.0))
        path.addLineToPoint(CGPointMake(88.0, 0.0))
        
        shapeLayer.frame = CGRectMake(3.0, 3.0, 88.0, 56.0)
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = RGB(red: 0.15, green: 0.15, blue: 0.15).CGColor
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.fillColor = nil
        shapeLayer.lineWidth = 6.0
        
        /// The receiver remains visible in its final state when the animation is completed.
        shapeLayer.fillMode = kCAFillModeForwards
        
        return shapeLayer
    }()
    
    init(title: String? = nil, subtitle: String? = nil) {
        super.init(title: title, subtitle: subtitle)
        checkMarkLayer.position = layer.position
        layer.addSublayer(checkMarkLayer)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        checkMarkLayer.position = layer.position
        layer.addSublayer(checkMarkLayer)
    }
    
    
}

extension DJHUDCheckMarkView: DJHUDAnimating {
    
    func startAnimating() {
        let animation = CAKeyframeAnimation(keyPath: DJAnimationKeyPath.strokeEnd)
        animation.keyTimes = [0, 1]
        animation.values = [0, 1]
        animation.duration = 0.35
        checkMarkLayer.addAnimation(animation, forKey: Constant.keyPath)
    }
    
    func stopAnimating() {
        checkMarkLayer.removeAnimationForKey(Constant.keyPath)
    }
    
}
