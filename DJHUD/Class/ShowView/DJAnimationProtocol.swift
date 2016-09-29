//
//  DJAnimationProtocol.swift
//  DJActivityIndicatorView
//
//  Created by 季勤强 on 16/9/28.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

protocol DJAnimation {
    func createBasicAnimation(keyPath: String)-> CABasicAnimation
    func createKeyframeAnimation(keyPath: String)-> CAKeyframeAnimation
    func createGroupAnimation()-> CAAnimationGroup
}

extension DJAnimation {
    
    func createBasicAnimation(keyPath: String)-> CABasicAnimation {
        let basicAnimation = CABasicAnimation(keyPath: keyPath)
        basicAnimation.removedOnCompletion = false
        return basicAnimation
    }
    
    func createKeyframeAnimation(keyPath: String)-> CAKeyframeAnimation {
        let keyframeAnimation = CAKeyframeAnimation(keyPath: keyPath)
        keyframeAnimation.removedOnCompletion = false
        return keyframeAnimation
    }
    
    func createGroupAnimation()-> CAAnimationGroup {
        let groupAnimation = CAAnimationGroup()
        groupAnimation.removedOnCompletion = false
        return groupAnimation
    }
    
}

protocol DJAnimationProtocol {
    
    /// setup animation
    func setupAnimation(layer: CALayer, size: CGSize, tintColor: UIColor)
}