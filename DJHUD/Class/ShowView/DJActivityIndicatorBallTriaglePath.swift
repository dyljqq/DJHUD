//
//  DJActivityIndicatorBallTriaglePath.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/30.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class DJActivityIndicatorBallTriaglePath: DJAnimation, DJAnimationProtocol {
    
    func setupAnimation(layer: CALayer, size: CGSize, tintColor: UIColor) {
        
        let width = size.width / 5.0
        let deltaX = (size.width - width) / 2
        let x = (layer.bounds.width - size.width) / 2
        
        let topAnimation = createAnimation()
        topAnimation.values = [NSValue(CATransform3D: CATransform3DMakeTranslation(0, 0, 0)),
                            NSValue(CATransform3D: CATransform3DMakeTranslation(deltaX, deltaX * 2, 0)),
                            NSValue(CATransform3D: CATransform3DMakeTranslation(-deltaX, deltaX * 2, 0)),
                            NSValue(CATransform3D: CATransform3DMakeTranslation(0, 0, 0))]
        
        let topCircle = createCircle(width, color: tintColor)
        topCircle.frame = CGRectMake(x + deltaX, x, width, width)
        topCircle.addAnimation(topAnimation, forKey: "DJActivityIndicatorBallTriaglePath")
        layer.addSublayer(topCircle)
        
        let bottomLeftAnimation = createAnimation()
        bottomLeftAnimation.values = [NSValue(CATransform3D: CATransform3DMakeTranslation(0, 0, 0)),
                               NSValue(CATransform3D: CATransform3DMakeTranslation(deltaX, -deltaX * 2, 0)),
                               NSValue(CATransform3D: CATransform3DMakeTranslation(2 * deltaX, 0, 0)),
                               NSValue(CATransform3D: CATransform3DMakeTranslation(0, 0, 0))]
        
        let bottomLeftCircle = createCircle(width, color: tintColor)
        bottomLeftCircle.frame = CGRectMake(x, x + size.width - width, width, width)
        bottomLeftCircle.addAnimation(bottomLeftAnimation, forKey: "DJActivityIndicatorBallTriaglePath")
        layer.addSublayer(bottomLeftCircle)
        
        let bottomRightAnimation = createAnimation()
        bottomRightAnimation.values = [NSValue(CATransform3D: CATransform3DMakeTranslation(0, 0, 0)),
                               NSValue(CATransform3D: CATransform3DMakeTranslation(-2 * deltaX, 0, 0)),
                               NSValue(CATransform3D: CATransform3DMakeTranslation(-deltaX, -deltaX * 2, 0)),
                               NSValue(CATransform3D: CATransform3DMakeTranslation(0, 0, 0))]
        
        let bottomRightCircle = createCircle(width, color: tintColor)
        bottomRightCircle.frame = CGRectMake(x + size.width - width, x + size.width - width, width, width)
        bottomRightCircle.addAnimation(bottomRightAnimation, forKey: "DJActivityIndicatorBallTriaglePath")
        layer.addSublayer(bottomRightCircle)
        
    }
    
    private func createCircle(size: CGFloat, color: UIColor)-> CAShapeLayer {
        let circle = CAShapeLayer()
        let path = UIBezierPath(roundedRect: CGRectMake(0, 0, size, size), cornerRadius: size / 2)
        circle.strokeColor = color.CGColor
        circle.path = path.CGPath
        circle.fillColor = nil
        circle.lineWidth = 1.0
        
        return circle
    }
    
    private func createAnimation()-> CAKeyframeAnimation {
        let timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        let animation = createKeyframeAnimation(DJAnimationKeyPath.transform)
        animation.timingFunctions = [timingFunction, timingFunction, timingFunction]
        animation.keyTimes = [0, 0.33, 0.66, 1.0]
        animation.duration = 1.5
        animation.repeatCount = .infinity
        return animation
    }
    
}

