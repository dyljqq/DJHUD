//
//  DJActivityIndicatorBallRotateClip.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/29.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class DJActivityIndicatorBallRotateClip: DJAnimation, DJAnimationProtocol {
    
    func setupAnimation(layer: CALayer, size: CGSize, tintColor: UIColor) {
        
        let circle = CAShapeLayer()
        circle.frame = CGRectMake((layer.bounds.width - size.width) / 2, (layer.bounds.height - size.height) / 2, size.width, size.height)
        circle.strokeColor = tintColor.CGColor
        circle.lineWidth = 2
        circle.fillColor = nil
        
        let path = UIBezierPath(arcCenter: CGPointMake(size.width / 2, size.height / 2), radius: size.width / 2, startAngle: 1.5 * CGFloat(M_PI), endAngle: CGFloat(M_PI), clockwise: true)
        circle.path = path.CGPath
        layer.addSublayer(circle)
        
        let scaleAnimation = createKeyframeAnimation(DJAnimationKeyPath.scale)
        scaleAnimation.values = [NSValue(CATransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0)),
                                 NSValue(CATransform3D: CATransform3DMakeScale(0.6, 0.6, 1.0)),
                                 NSValue(CATransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0))]
        scaleAnimation.keyTimes = [0.0, 0.5, 1.0]
        
        let rotateAnimation = createKeyframeAnimation(DJAnimationKeyPath.transform_rotation_z)
        rotateAnimation.values = [0, M_PI, 2 * M_PI]
        rotateAnimation.keyTimes = scaleAnimation.keyTimes
        
        let groupAnimation = createGroupAnimation()
        groupAnimation.duration = 0.75
        groupAnimation.repeatCount = .infinity
        groupAnimation.animations = [scaleAnimation, rotateAnimation]
        groupAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        circle.addAnimation(groupAnimation, forKey: "DJActivityIndicatorBallRotateClip")
        
    }
    
}
