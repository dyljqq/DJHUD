//
//  DJActivityIndicatorCookieTerminal.swift
//  DJHUD
//
//  Created by 季勤强 on 16/10/8.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class DJActivityIndicatorCookieTerminal: DJAnimation, DJAnimationProtocol {
    
    func setupAnimation(layer: CALayer, size: CGSize, tintColor: UIColor) {
        
        let x = (layer.bounds.width - size.width) / 2 + 20
        let y = layer.bounds.height / 2
        let center = CGPointMake(x, y)
        let radius = size.width / 4
        let duration = 0.3
        
        let cookiePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(M_PI_4), endAngle: CGFloat(1.75 * M_PI), clockwise: true)
        cookiePath.addLineToPoint(center)
        cookiePath.closePath()
        
        let cookieLayer = CAShapeLayer()
        cookieLayer.fillColor = tintColor.CGColor
        cookieLayer.path = cookiePath.CGPath
        layer.addSublayer(cookieLayer)
        
        let path = UIBezierPath(arcCenter: CGPointMake(0.0, 0.0), radius: radius, startAngle: CGFloat(M_PI_2), endAngle: CGFloat(1.5 * M_PI), clockwise: true)
        path.closePath()
        
        for index in 0..<2 {
            let sl = CAShapeLayer()
            sl.path = path.CGPath
            sl.fillColor = tintColor.CGColor
            sl.position = center
            sl.transform = CATransform3DMakeRotation(CGFloat(M_PI_4) * CGFloat(1 - 2 * index), 0, 0, 1.0)
            layer.addSublayer(sl)
            
            let animation = createBasicAnimation(DJAnimationKeyPath.transform)
            animation.fromValue = NSValue(CATransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4) * CGFloat(1 - 2 * index), 0, 0, 1.0))
            animation.toValue = NSValue(CATransform3D: CATransform3DMakeRotation(CGFloat(M_PI_2) * CGFloat(1 - 2 * index), 0, 0, 1.0))
            animation.duration = duration
            animation.repeatCount = .infinity
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            sl.addAnimation(animation, forKey: "DJActivityIndicatorCookieTerminal")
            
        }
        
        let circleSize: CGFloat = radius / 5
        let padding = circleSize * 2
        
        for index in 0..<3 {
            let circleLayer = CALayer()
            circleLayer.frame = CGRectMake(x + (circleSize + padding) * 3, (layer.bounds.height - circleSize)/2, circleSize, circleSize)
            circleLayer.cornerRadius = circleSize / 2
            circleLayer.backgroundColor = tintColor.CGColor
            layer.addSublayer(circleLayer)
            
            let animation = createBasicAnimation(DJAnimationKeyPath.transform)
            animation.duration = duration * 6
            animation.beginTime = CACurrentMediaTime() - (Double(index) * animation.duration / 3)
            animation.fromValue = NSValue(CATransform3D: CATransform3DMakeTranslation(0, 0, 0))
            animation.toValue = NSValue(CATransform3D: CATransform3DMakeTranslation(-3 * (circleSize + padding), 0, 0))
            animation.repeatCount = .infinity
            circleLayer.addAnimation(animation, forKey: "DJActivityIndicatorCookieTerminal")
            
        }
        
    }
    
}


