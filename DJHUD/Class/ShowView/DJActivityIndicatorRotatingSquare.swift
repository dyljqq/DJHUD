//
//  DJActivityIndicatorRotatingSqure.swift
//  DJActivityIndicatorView
//
//  Created by 季勤强 on 16/9/28.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class DJActivityIndicatorRotatingSquare: DJAnimation, DJAnimationProtocol {
    
    var degreeToRadius: (angle: CGFloat)-> CGFloat = { angle in
        return (angle / 180) * CGFloat(M_PI)
    }
    
    func setupAnimation(layer: CALayer, size: CGSize, tintColor: UIColor) {
        
        let squreWidth = floor(size.width / 4.0)
        let x = (layer.bounds.width - size.width) / 2.0
        let y = (layer.bounds.height - size.height) / 2.0
        for index in 0..<2 {
            let squre = CALayer()
            squre.frame = CGRectMake(x, y, squreWidth, squreWidth)
            squre.backgroundColor = tintColor.CGColor
            layer.addSublayer(squre)
            
            let transformAnimation = createKeyframeAnimation(DJAnimationKeyPath.transform)
            var values = [NSValue]()
            var timeFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)]
            values.append(NSValue(CATransform3D: CATransform3DIdentity))
            var sizes = [CGSizeMake(size.width - squreWidth, 0),
                         CGSizeMake(size.width - squreWidth, size.height - squreWidth),
                         CGSizeMake(0, size.height - squreWidth),
                         CGSizeMake(0, 0)]
            for i in 0..<4 {
                var t = CATransform3DMakeTranslation(sizes[i].width, sizes[i].height, 0)
                t = CATransform3DRotate(t, -90 * CGFloat(i + 1), 0, 0, 1.0)
                let scale: CGFloat = i % 2 == 0 ? 0.5 : 1.0
                t = CATransform3DScale(t, scale, scale, 1.0)
                values.append(NSValue(CATransform3D: t))
                timeFunctions.append(CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
            }
            transformAnimation.keyTimes = [0.0, 0.25, 0.5, 0.75, 1.0]
            transformAnimation.values = values
            transformAnimation.beginTime = CACurrentMediaTime() - 0.8 * Double(index)
            transformAnimation.duration = 1.6
            transformAnimation.repeatCount = .infinity
            transformAnimation.timingFunctions = timeFunctions
            squre.addAnimation(transformAnimation, forKey: "DJActivityIndicatorRotatingSqure")
            
        }
        
    }
    
}