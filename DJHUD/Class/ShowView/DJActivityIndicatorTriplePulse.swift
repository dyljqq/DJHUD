//
//  DJActivityIndicatorTriplePulse.swift
//  DJActivityIndicatorView
//
//  Created by 季勤强 on 16/9/28.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class DJActivityIndicatorTriplePulse: DJAnimation, DJAnimationProtocol {
    
    func setupAnimation(layer: CALayer, size: CGSize, tintColor: UIColor) {
        for index in 0..<4 {
            let circle = CALayer()
            circle.frame = CGRectMake((layer.bounds.width - size.width) / 2.0, (layer.bounds.height - size.height) / 2.0, size.width, size.height)
            circle.backgroundColor = whiteColor.CGColor
            circle.cornerRadius = size.width / 2
            circle.masksToBounds = true
            circle.opacity = 0.8
            circle.transform = CATransform3DMakeScale(0.0, 0.0, 0.0)
            layer.addSublayer(circle)
            
            let opacityAnimation = createBasicAnimation(DJAnimationKeyPath.opacity)
            opacityAnimation.fromValue = 0.8
            opacityAnimation.toValue = 0.0
            
            let transformAnimation = createBasicAnimation(DJAnimationKeyPath.transform)
            transformAnimation.fromValue = NSValue(CATransform3D: CATransform3DMakeScale(0.0, 0.0, 0.0))
            transformAnimation.toValue = NSValue(CATransform3D: CATransform3DMakeScale(1.0, 1.0, 0.0))
            
            let groupAnimation = createGroupAnimation()
            groupAnimation.animations = [opacityAnimation, transformAnimation]
            groupAnimation.duration = 1.2
            groupAnimation.beginTime = CACurrentMediaTime() + Double(index) * 0.2
            groupAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            groupAnimation.repeatCount = .infinity
            circle.addAnimation(groupAnimation, forKey: "DJActivityIndicatorTriplePulse")
        }
    }
    
}