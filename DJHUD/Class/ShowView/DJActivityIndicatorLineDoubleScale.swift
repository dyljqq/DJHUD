//
//  DJActivityIndicatorLineDoubleScale.swift
//  DJHUD
//
//  Created by 季勤强 on 16/10/8.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class DJActivityIndicatorLineDoubleScale: DJAnimation, DJAnimationProtocol {
    
    func setupAnimation(layer: CALayer, size: CGSize, tintColor: UIColor) {
        
        let x: CGFloat = (layer.bounds.width - size.width) / 2
        let lineWidth: CGFloat = 2
        let padding = (size.width - 6 * lineWidth) / 5
        let duration = 0.7
        for index in 0..<6 {
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
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.repeatCount = .infinity
            animation.duration = duration
            animation.beginTime = index % 2 == 1 ? CACurrentMediaTime() + duration / 2 : CACurrentMediaTime()
            shapeLayer.addAnimation(animation, forKey: "DJActivityIndicatorLineDoubleScale")
        }
        
    }
    
}
