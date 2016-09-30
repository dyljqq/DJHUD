//
//  DJActivityIndicatorBallScaleMultiple.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/30.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class DJActivityIndicatorBallScaleMultiple: DJAnimationProtocol, DJAnimation {
    
    func setupAnimation(layer: CALayer, size: CGSize, tintColor: UIColor) {
        
        for index in 0..<3 {
            let circle = CALayer()
            let x = (layer.bounds.width - size.width) / 2
            circle.frame = CGRectMake(x, x, size.width, size.width)
            circle.cornerRadius = size.width / 2
            circle.backgroundColor = tintColor.CGColor
            circle.opacity = 0
            layer.addSublayer(circle)
            
            let scaleAnimation = createBasicAnimation(DJAnimationKeyPath.scale)
            scaleAnimation.fromValue = 0.0
            scaleAnimation.toValue = 1.0
            
            let opacityAnimation = createKeyframeAnimation(DJAnimationKeyPath.opacity)
            opacityAnimation.values = [0, 1.0, 0]
            opacityAnimation.keyTimes = [0.0, 0.5, 1.0]
            
            let animation = createGroupAnimation()
            animation.animations = [scaleAnimation, opacityAnimation]
            animation.duration = 1.0
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            animation.repeatCount = .infinity
            animation.beginTime = CACurrentMediaTime() + 0.2 * Double(index)
            circle.addAnimation(animation, forKey: "DJActivityIndicatorBallScaleMultiple")
        }
        
    }
    
}

