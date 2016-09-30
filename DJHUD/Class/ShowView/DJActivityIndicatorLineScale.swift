//
//  DJActivityIndicatorLineScale.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/30.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class DJActivityIndicatorLineScale: DJAnimationProtocol, DJAnimation {
    
    func setupAnimation(layer: CALayer, size: CGSize, tintColor: UIColor) {
        let x = (layer.bounds.width - size.width) / 2
        let lineWidth: CGFloat = 2.0
        let padding = (size.width - 5 * lineWidth) / 4
        for index in 0..<5 {
            let line = CAShapeLayer()
            line.frame = CGRectMake(x + CGFloat(index) * (padding + lineWidth), x, lineWidth, size.height)
            line.strokeColor = tintColor.CGColor
            line.lineWidth = lineWidth
            line.lineCap = kCALineCapRound
            let path = UIBezierPath(roundedRect: CGRectMake(0, 0, lineWidth, size.width), cornerRadius: lineWidth / 2)
            line.path = path.CGPath
            layer.addSublayer(line)
            
            let animation = createKeyframeAnimation(DJAnimationKeyPath.scale)
            animation.values = [1.0, 0.5, 1.0]
            animation.duration = 0.75
            animation.repeatCount = .infinity
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            animation.beginTime = CACurrentMediaTime() + Double(index) * 0.1
            line.addAnimation(animation, forKey: "DJActivityIndicatorLineScale")
            
        }
        
    }
    
}
