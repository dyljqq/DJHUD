//
//  DJErrorView.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/26.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

public class DJHUDErrorView: DJHUDBaseView {
    
    let dashOneLayer = DJHUDErrorView.createShapeLayer()
    let dashTwoLayer = DJHUDErrorView.createShapeLayer()
    
    private class func createShapeLayer()-> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = CGRectMake(0.0, 0.0, 88.0, 88.0)
        shapeLayer.path = {
            let path = UIBezierPath()
            path.moveToPoint(CGPointMake(0.0, 44.0))
            path.addLineToPoint(CGPointMake(88.0, 44.0))
            return path.CGPath
        }()
        shapeLayer.fillColor = nil
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.strokeColor = RGB(red: 0.15, green: 0.15, blue: 0.15).CGColor
        shapeLayer.lineWidth = 6
        shapeLayer.fillMode = kCAFillModeForwards
        
        return shapeLayer
    }
    
    public init(title: String? = nil, subtitle: String? = nil) {
        super.init(title: title, subtitle: subtitle)
        layer.addSublayer(dashOneLayer)
        layer.addSublayer(dashTwoLayer)
        dashOneLayer.position = layer.position
        dashTwoLayer.position = layer.position
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func rotationAnimation(angle: CGFloat)-> CABasicAnimation {
        let animation = CASpringAnimation(keyPath: DJAnimationKeyPath.transform_rotation_z)
        animation.mass = 0.22
        animation.damping = 1.5
        animation.initialVelocity = 0.5
        
        animation.fromValue = 0
        animation.toValue = angle * CGFloat(M_PI / 180)
        animation.duration = 1.0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        return animation
    }
    
}

extension DJHUDErrorView: DJHUDAnimating {
    
    func startAnimating() {
        
        // convert the axis
        dashOneLayer.transform = CATransform3DMakeRotation(45 * CGFloat(M_PI/180), 0.0, 0.0, 1.0)
        dashTwoLayer.transform = CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0.0, 0.0, 1.0)
        
        dashOneLayer.addAnimation(rotationAnimation(45.0), forKey: "DJError.Rotation.Spring.DashOne")
        dashTwoLayer.addAnimation(rotationAnimation(-45.0), forKey: "DJError.Rotation.Spring.DashTwo")
    }
    
    func stopAnimating() {
        
    }
    
}
