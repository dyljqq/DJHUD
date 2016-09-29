//
//  DJActivityIndicatorFiveDots.swift
//  DJActivityIndicatorView
//
//  Created by 季勤强 on 16/9/28.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class DJActivityIndicatorFiveDots: DJAnimation, DJAnimationProtocol {
    
    func setupAnimation(layer: CALayer, size: CGSize, tintColor: UIColor) {
        
        let circleSize = size.width / 5.0
        let circlePadding: CGFloat = 0.0
        let x = (layer.bounds.width - size.width) / 2.0
        let y = (layer.bounds.height - circleSize) / 2.0
        for index in 0..<5 {
            let circleLayer = CALayer()
            circleLayer.frame = CGRectMake(x + (circleSize + circlePadding) * CGFloat(index), y, circleSize, circleSize)
            circleLayer.backgroundColor = tintColor.CGColor
            circleLayer.cornerRadius = circleSize / 2
            circleLayer.masksToBounds = true
            layer.addSublayer(circleLayer)
            
            let transformAnimation = createKeyframeAnimation(DJAnimationKeyPath.transform)
            if index % 2 == 0 {
                var t1 = CATransform3DMakeTranslation(0.0, 0.0, 0.0)
                t1 = CATransform3DScale(t1, 1.0, 1.0, 0.0)
                
                var t2 = CATransform3DMakeTranslation(0.0, -2.0 * circleSize, 0.0)
                t2 = CATransform3DScale(t2, 1.0, 1.0, 0.0)
                
                var t3 = CATransform3DMakeTranslation(0.0, 0.0, 0.0)
                t3 = CATransform3DScale(t3, 0.3, 0.3, 0.0)
                
                var t4 = CATransform3DMakeTranslation(0.0, 2.0 * circleSize, 0.0)
                t4 = CATransform3DScale(t4, 1.0, 1.0, 0.0)
                
                var t5 = CATransform3DMakeTranslation(0.0, 0.0, 0.0)
                t5 = CATransform3DScale(t5, 1.0, 1.0, 0.0)
                transformAnimation.values = [NSValue(CATransform3D: t1),
                                             NSValue(CATransform3D: t2),
                                             NSValue(CATransform3D: t3),
                                             NSValue(CATransform3D: t4),
                                             NSValue(CATransform3D: t5)]
            } else {
                var t1 = CATransform3DMakeTranslation(0.0, 0.0, 0.0)
                t1 = CATransform3DScale(t1, 0.3, 0.3, 0.0)
                
                var t2 = CATransform3DMakeTranslation(0.0, 2.0 * circleSize, 0.0)
                t2 = CATransform3DScale(t2, 1.0, 1.0, 0.0)
                
                var t3 = CATransform3DMakeTranslation(0.0, -2.0 * circleSize, 0.0)
                t3 = CATransform3DScale(t3, 1.0, 1.0, 0.0)
                
                var t4 = CATransform3DMakeTranslation(0.0, 0.0, 0.0)
                t4 = CATransform3DScale(t4, 0.3, 0.3, 0.0)
                
                transformAnimation.values = [NSValue(CATransform3D: t1),
                                             NSValue(CATransform3D: t2),
                                             NSValue(CATransform3D: t3),
                                             NSValue(CATransform3D: t4)]
            }
            transformAnimation.beginTime = CACurrentMediaTime()
            transformAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            transformAnimation.repeatCount = .infinity
            transformAnimation.duration = 1.0
            circleLayer.addAnimation(transformAnimation, forKey: "DJActivityIndicatorFiveDots1")
        }
        
    }
    
}