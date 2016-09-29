//
//  DJActivityIndicatorNineDots.swift
//  DJActivityIndicatorView
//
//  Created by 季勤强 on 16/9/28.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class DJActivityIndicatorNineDots: DJAnimationProtocol, DJAnimation {
    
    // MARK: - Animation
    
    func setupAnimation(layer: CALayer, size: CGSize, tintColor: UIColor) {
        
        let duration = [0.72, 1.02, 1.28,
                        1.42, 1.45, 1.18,
                        0.87, 1.45, 1.06]
        let timeoffset = [0.11, 0.42, 0.0,
                          0.65, 0.48, 0.2,
                          0.63, 0.95, 0.62]
        
        let width: CGFloat = 100.0
        let margin = (layer.bounds.width - width) / 2
        let circleSize: CGFloat = width / 4.0
        let circlePadding = circleSize / 2.0
        let x: CGFloat = margin
        let y: CGFloat = margin
        
        for index in 0..<min(duration.count, timeoffset.count) {
            let circleLayer = CALayer()
            circleLayer.frame = CGRectMake(x + (circleSize + circlePadding) * CGFloat(index % 3), y + (circleSize + circlePadding) * CGFloat(index / 3), circleSize, circleSize)
            circleLayer.backgroundColor = tintColor.CGColor
            circleLayer.cornerRadius = circleSize / 2
            layer.addSublayer(circleLayer)
            
            let opacityAnimation = createKeyframeAnimation(DJAnimationKeyPath.opacity)
            opacityAnimation.values = [0.5, 1.0, 0.5]
            
            let transformAnimation = createKeyframeAnimation(DJAnimationKeyPath.transform)
            transformAnimation.values = [
                NSValue(CATransform3D: CATransform3DMakeScale(0.5, 0.5, 0.0)),
                NSValue(CATransform3D: CATransform3DMakeScale(1.0, 1.0, 0.0)),
                NSValue(CATransform3D: CATransform3DMakeScale(0.5, 0.5, 0.0))
            ]
            
            let animationGroup = createGroupAnimation()
            animationGroup.animations = [opacityAnimation, transformAnimation]
            animationGroup.timeOffset = timeoffset[index]
            animationGroup.duration = duration[index]
            animationGroup.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            animationGroup.repeatCount = .infinity
            circleLayer.addAnimation(animationGroup, forKey: "DJActivityIndicatorNineDots")
        }
    }
    
}
