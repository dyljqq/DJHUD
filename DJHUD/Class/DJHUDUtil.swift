//
//  DJHUDUtil.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/23.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

// MARK: - Constant value

let DJAlpha: CGFloat = 0.85
let whiteColor = UIColor.whiteColor()
let blackColor = UIColor.blackColor()
let clearColor = UIColor.clearColor()

// MARK: - Color

private func convertColor(color: CGFloat)-> CGFloat {
    return color >= 0.0 && color <= 1.0 ? color : color / 255.0
}

func RGB(red red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0)-> UIColor {
    var alpha = alpha
    if alpha < 0 {
        alpha = 0.0
    } else if alpha > 1.0 {
        alpha = 1.0
    }
    return UIColor(red: convertColor(red), green: convertColor(green), blue: convertColor(blue), alpha: alpha)
}

// MARK: - Other

let defaultFrame = CGRect(origin: CGPointZero, size: CGSizeMake(156.0, 156.0))


// MARK: - Extension

extension UIView {
    
    var dj_yh: CGFloat {
        return frame.origin.y + frame.height
    }
    
}

// common func

func delay(delay: Double, closure: ()-> ()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}