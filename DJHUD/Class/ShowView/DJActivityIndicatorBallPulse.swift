//
//  DJActivityIndicatorThreeDots.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/29.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class DJActivityIndicatorBallPulse: DJAnimation, DJAnimationProtocol {
    
    func setupAnimation(layer: CALayer, size: CGSize, tintColor: UIColor) {
        let width = size.width / 4
        let margin = (layer.bounds.width - size.width) / 2.0
        for index in 0..<3 {
            let circle = CALayer()
            circle.frame = CGRectMake(margin + (width + width / 2.0) * CGFloat(index), (layer.bounds.height - width) / 2.0, width, width)
            circle.backgroundColor = tintColor.CGColor
            circle.cornerRadius = width / 2
            layer.addSublayer(circle)
            
            let transformAnimation = createKeyframeAnimation(DJAnimationKeyPath.transform)
            transformAnimation.values = [NSValue(CATransform3D: CATransform3DMakeScale(1.0, 1.0, 0)),
                                         NSValue(CATransform3D: CATransform3DMakeScale(0.3, 0.3, 0)),
                                         NSValue(CATransform3D: CATransform3DMakeScale(1.0, 1.0, 0))]
            transformAnimation.keyTimes = [0.0, 0.3, 1.0]
            transformAnimation.timingFunctions = [CAMediaTimingFunction(controlPoints: 0.2, 0.68, 0.18, 1.08),
                                                  CAMediaTimingFunction(controlPoints: 0.2, 0.68, 0.18, 1.08)]
            transformAnimation.duration = 0.75
            transformAnimation.repeatCount = .infinity
            transformAnimation.beginTime = 0.12 * (Double(index) + 1)
            
            circle.addAnimation(transformAnimation, forKey: "DJActivityIndicatorThreeDots")
        }
        
    }
    
}