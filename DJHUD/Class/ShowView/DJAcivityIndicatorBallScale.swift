//
//  DJAcivityIndicatorBallScale.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/30.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class DJAcivityIndicatorBallScale: DJAnimation, DJAnimationProtocol {
    
    func setupAnimation(layer: CALayer, size: CGSize, tintColor: UIColor) {
        
        let circle = CALayer()
        circle.frame = CGRectMake((layer.bounds.width - size.width) / 2, (layer.bounds.height - size.height) / 2, size.width, size.height)
        circle.backgroundColor = tintColor.CGColor
        circle.cornerRadius = size.width / 2
        circle.transform = CATransform3DMakeScale(0, 0, 0)
        layer.addSublayer(circle)
        
        let opacityAnimation = createKeyframeAnimation(DJAnimationKeyPath.opacity)
        opacityAnimation.values = [1.0, 0.0]
        
        let scaleAnimation = createKeyframeAnimation(DJAnimationKeyPath.scale)
        scaleAnimation.values = [0.0, 1.0]
        
        let groupAnimation = createGroupAnimation()
        groupAnimation.duration = 0.75
        groupAnimation.animations = [scaleAnimation, opacityAnimation]
        groupAnimation.repeatCount = .infinity
        groupAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        circle.addAnimation(groupAnimation, forKey: "DJAcivityIndicatorBallScale")
        
    }
    
}
