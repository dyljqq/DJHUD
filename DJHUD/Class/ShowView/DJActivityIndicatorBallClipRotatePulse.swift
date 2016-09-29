//
//  DJActivityIndicatorBallClipRotatePulse.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/29.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class DJActivityIndicatorBallClipRotatePulse: DJAnimation, DJAnimationProtocol {
    
    func setupAnimation(layer: CALayer, size: CGSize, tintColor: UIColor) {
        
        for index in 0..<2 {
            let arc = CAShapeLayer()
            arc.strokeColor = tintColor.CGColor
            arc.frame = CGRectMake((layer.bounds.width - size.width) / 2, (layer.bounds.height - size.height) / 2, size.width, size.height)
            arc.lineWidth = 2
            arc.fillColor = nil
            
            let path = UIBezierPath(arcCenter: CGPoint(x: size.width / 2, y: size.height / 2), radius: size.width / 2, startAngle: -0.25 * CGFloat(M_PI) + CGFloat(M_PI) * CGFloat(index), endAngle: 0.25 * CGFloat(M_PI) + CGFloat(M_PI) * CGFloat(index), clockwise: true)
            arc.path = path.CGPath
            layer.addSublayer(arc)
            
            let rotateAnimation = createKeyframeAnimation(DJAnimationKeyPath.transform_rotation_z)
            rotateAnimation.values = [0, M_PI, 2 * M_PI]
            
            let scaleAnimation = createKeyframeAnimation(DJAnimationKeyPath.scale)
            scaleAnimation.values = [1.0, 0.5, 1.0]
            
            let groupAnimation = createGroupAnimation()
            groupAnimation.animations = [rotateAnimation, scaleAnimation]
            groupAnimation.duration = 0.75
            groupAnimation.repeatCount = .infinity
            groupAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            arc.addAnimation(groupAnimation, forKey: "DJActivityIndicatorBallClipRotatePulseArc")
        }
        
        let circle = CALayer()
        circle.backgroundColor = tintColor.CGColor
        circle.frame = CGRectMake((layer.bounds.width - (size.width / 2)) / 2, (layer.bounds.height - (size.height / 2)) / 2, size.width / 2, size.height / 2)
        circle.cornerRadius = size.width / 4
        layer.addSublayer(circle)
        
        let scaleAnimation = createKeyframeAnimation(DJAnimationKeyPath.scale)
        scaleAnimation.values = [1.0, 0.3, 1.0]
        scaleAnimation.duration = 0.75
        scaleAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        scaleAnimation.repeatCount = .infinity
        circle.addAnimation(scaleAnimation, forKey: "DJActivityIndicatorBallClipRotatePulseCircle")
        
    }
    
}