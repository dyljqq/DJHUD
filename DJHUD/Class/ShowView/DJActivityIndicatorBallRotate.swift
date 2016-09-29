//
//  DJActivityIndicatorBallRotate.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/29.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class DJActivityIndicatorBallRotate: DJAnimationProtocol, DJAnimation {
    
    func setupAnimation(layer: CALayer, size: CGSize, tintColor: UIColor) {
        
        let timingFunction = CAMediaTimingFunction(controlPoints: 0.7, -0.13, 0.22, 0.86)

        let rotateAnimation = createKeyframeAnimation(DJAnimationKeyPath.transform_rotation_z)
        rotateAnimation.values = [0, M_PI, 2 * M_PI]
        rotateAnimation.timingFunctions = [timingFunction, timingFunction]
        
        let scaleAnimation = createKeyframeAnimation(DJAnimationKeyPath.scale)
        scaleAnimation.values = [NSValue(CATransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0)),
                                 NSValue(CATransform3D: CATransform3DMakeScale(0.6, 0.6, 1.0)),
                                 NSValue(CATransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0))]
        scaleAnimation.timingFunctions = [timingFunction, timingFunction]
        
        let groupAnimation = createGroupAnimation()
        groupAnimation.animations = [rotateAnimation, scaleAnimation]
        groupAnimation.duration = 0.75
        groupAnimation.repeatCount = .infinity
        
        let width: CGFloat = size.width / 5
        let leftCircle = CALayer()
        leftCircle.frame = CGRectMake(0, (size.height - width) / 2, width, width)
        leftCircle.backgroundColor = tintColor.CGColor
        leftCircle.cornerRadius = width / 2
        leftCircle.opacity = 0.8
        
        let rightCircle = CALayer()
        rightCircle.frame = CGRectMake(size.width - width, (size.height - width) / 2, width, width)
        rightCircle.backgroundColor = tintColor.CGColor
        rightCircle.cornerRadius = width / 2
        rightCircle.opacity = 0.8
        
        let centerCircle = CALayer()
        centerCircle.frame = CGRectMake((size.width - width) / 2, (size.height - width) / 2, width, width)
        centerCircle.backgroundColor = tintColor.CGColor
        centerCircle.cornerRadius = width / 2
        
        let circle = CALayer()
        circle.frame = CGRectMake((layer.bounds.width - size.width) / 2, (layer.bounds.width - size.width) / 2, size.width, size.height)
        circle.cornerRadius = size.width / 2
        
        circle.addSublayer(leftCircle)
        circle.addSublayer(centerCircle)
        circle.addSublayer(rightCircle)
        layer.addSublayer(circle)
        
        circle.addAnimation(groupAnimation, forKey: "DJActivityIndicatorBallRotate")
        
    }
    
}