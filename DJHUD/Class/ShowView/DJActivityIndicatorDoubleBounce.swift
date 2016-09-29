//
//  DJActivityIndicatorDoubleBounce.swift
//  DJActivityIndicatorView
//
//  Created by 季勤强 on 16/9/28.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class DJActivityIndicatorDoubleBounce: DJAnimation, DJAnimationProtocol {
    
    func setupAnimation(layer: CALayer, size: CGSize, tintColor: UIColor) {
        
        let x = (layer.bounds.width - size.width) / 2
        let y = (layer.bounds.height - size.height) / 2
        
        for index in 0..<2 {
            let circle = CALayer()
            circle.frame = CGRectMake(x, y, size.width, size.height)
            circle.backgroundColor = tintColor.CGColor
            circle.transform = CATransform3DMakeScale(0, 0, 0)
            circle.cornerRadius = size.width / 2
            circle.opacity = 0.5
            layer.addSublayer(circle)
            
            let transformAnimation = createKeyframeAnimation(DJAnimationKeyPath.transform)
            transformAnimation.duration = 2.0
            transformAnimation.beginTime = CACurrentMediaTime() - (Double(index) * 1.0)
            transformAnimation.values = [NSValue(CATransform3D: CATransform3DMakeScale(0.0, 0.0, 0.0)),
                                         NSValue(CATransform3D: CATransform3DMakeScale(1.0, 1.0, 0.0)),
                                         NSValue(CATransform3D: CATransform3DMakeScale(0.0, 0.0, 0.0))]
            transformAnimation.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut),
                                                  CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut),
                                                  CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
            transformAnimation.repeatCount = .infinity
            circle.addAnimation(transformAnimation, forKey: "DJActivityIndicatorDoubleBounce")
        }
        
    }
    
}