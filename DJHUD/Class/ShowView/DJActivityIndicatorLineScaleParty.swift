//
//  DJActivityIndicatorLineScaleParty.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/30.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class DJActivityIndicatorLineScaleParty: DJAnimation, DJAnimationProtocol {
    
    func setupAnimation(layer: CALayer, size: CGSize, tintColor: UIColor) {
        let lineWidth: CGFloat = 2
        let padding = (size.width - lineWidth * 4) / 3
        let durations = [1.0, 0.25, 1.0, 0.5]
        let x = (layer.bounds.width - size.width) / 2
        for index in 0..<4 {
            let shapeLayer = CAShapeLayer()
            shapeLayer.frame = CGRectMake(x + (lineWidth + padding) * CGFloat(index), x, lineWidth, size.height)
            shapeLayer.strokeColor = tintColor.CGColor
            shapeLayer.lineCap = kCALineCapRound
            shapeLayer.lineWidth = lineWidth
            let path = UIBezierPath(roundedRect: CGRectMake(0, 0, lineWidth, size.height), cornerRadius: size.width / 2)
            shapeLayer.path = path.CGPath
            shapeLayer.fillColor = nil
            layer.addSublayer(shapeLayer)
            
            let animation = createKeyframeAnimation(DJAnimationKeyPath.scale)
            animation.values = [1.0, 0.5, 1.0]
            animation.duration = durations[index]
            animation.repeatCount = .infinity
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            shapeLayer.addAnimation(animation, forKey: "DJActivityIndicatorLineScaleParty")
            
        }
        
    }
    
}
