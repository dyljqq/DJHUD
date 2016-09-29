//
//  DJActivityIndicatorBallRotateMultiple.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/29.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class DJActivityIndicatorBallRotateMultiple: DJAnimation, DJAnimationProtocol {
    
    func setupAnimation(layer: CALayer, size: CGSize, tintColor: UIColor) {
        
        // big
        for index in 0..<2 {
            let arc = CAShapeLayer()
            arc.strokeColor = tintColor.CGColor
            arc.frame = CGRectMake((layer.bounds.width - size.width) / 2, (layer.bounds.height - size.height) / 2, size.width, size.height)
            arc.lineWidth = 2
            arc.fillColor = nil
            
            let path = UIBezierPath(arcCenter: CGPoint(x: size.width / 2, y: size.height / 2), radius: size.width / 2, startAngle: -0.75 * CGFloat(M_PI) + CGFloat(M_PI) * CGFloat(index), endAngle: -0.25 * CGFloat(M_PI) + CGFloat(M_PI) * CGFloat(index), clockwise: true)
            arc.path = path.CGPath
            layer.addSublayer(arc)
            
            let rotateAnimation = self.createKeyframeAnimation(DJAnimationKeyPath.transform_rotation_z)
            rotateAnimation.values = [0, M_PI, 2 * M_PI]
            
            let scaleAnimation = self.createKeyframeAnimation(DJAnimationKeyPath.scale)
            scaleAnimation.values = [1.0, 0.5, 1.0]
            
            let groupAnimation = self.createGroupAnimation()
            groupAnimation.animations = [rotateAnimation, scaleAnimation]
            groupAnimation.duration = 1.0
            groupAnimation.repeatCount = .infinity
            groupAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            arc.addAnimation(groupAnimation, forKey: "DJActivityIndicatorBallClipRotatePulseArc")
        }
        
        // small
        
        let width = size.width / 2
        for index in 0..<2 {
            let arc = CAShapeLayer()
            arc.strokeColor = tintColor.CGColor
            arc.frame = CGRectMake((layer.bounds.width - width) / 2, (layer.bounds.height - width) / 2, width, width)
            arc.lineWidth = 2
            arc.fillColor = nil
            
            let path = UIBezierPath(arcCenter: CGPoint(x: width / 2, y: width / 2), radius: width / 2, startAngle: -0.25 * CGFloat(M_PI) + CGFloat(M_PI) * CGFloat(index), endAngle: 0.25 * CGFloat(M_PI) + CGFloat(M_PI) * CGFloat(index), clockwise: true)
            arc.path = path.CGPath
            layer.addSublayer(arc)
            
            let rotateAnimation = self.createKeyframeAnimation(DJAnimationKeyPath.transform_rotation_z)
            rotateAnimation.values = [0, -M_PI, -2 * M_PI]
            
            let scaleAnimation = self.createKeyframeAnimation(DJAnimationKeyPath.scale)
            scaleAnimation.values = [1.0, 0.5, 1.0]
            
            let groupAnimation = self.createGroupAnimation()
            groupAnimation.animations = [rotateAnimation, scaleAnimation]
            groupAnimation.duration = 0.5
            groupAnimation.repeatCount = .infinity
            groupAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            arc.addAnimation(groupAnimation, forKey: "DJActivityIndicatorBallClipRotatePulseArc2")
        }
        
    }
    
}
