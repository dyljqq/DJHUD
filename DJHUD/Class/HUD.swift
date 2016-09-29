//
//  HUD.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/23.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

public enum DJHUDType {
    case Success
    case Error
    case Progress
    
    // ActivityIndicatorType
    case NineDots
    case TriplePulse
    case FiveDots
    case RotatingSquare
    case DoubleBounce
    case BallPulse
    case BallRotateClip
    case BallClipRotatePulse
    case BallRotateMultiple
    case BallRotate
    
    var description: String {
        switch self {
        case .Success: return "Success"
        case .Error: return "Error"
        case .Progress: return "Progress"
        case .NineDots: return "NineDots"
        case .TriplePulse: return "TriplePulse"
        case .FiveDots: return "FiveDots"
        case .RotatingSquare: return "RotatingSquare"
        case .DoubleBounce: return "DoubleBounce"
        case .BallPulse: return "BallPulse"
        case .BallRotateClip: return "BallRotateClip"
        case .BallClipRotatePulse: return "BallClipRotatePulse"
        case .BallRotateMultiple: return "BallRotateMultiple"
        case .BallRotate: return "BallRotate"
        }
    }
    
}

public class HUD {
    
    public static func show(type: DJHUDType = .Success) {
        DJHUD.sharedManager.contentView = contentView(type)
        DJHUD.sharedManager.show()
    }
    
    public class func hide() {
        DJHUD.sharedManager.hide(2.0, anim: true)
    }
    
    public class func flash(type: DJHUDType = .Success) {
        HUD.show(type)
        HUD.hide()
    }
    
    private class func contentView(type: DJHUDType = .Success)-> UIView {
        switch type {
        case .Success:
            DJHUD.sharedManager.visualViewBackgroundColor = VisualViewColor.white.description
            return DJHUDCheckMarkView()
        case .Error:
            DJHUD.sharedManager.visualViewBackgroundColor = VisualViewColor.white.description
            return DJHUDErrorView()
        case .Progress:
            DJHUD.sharedManager.visualViewBackgroundColor = VisualViewColor.white.description
            return DJHUDProgessView()
        case .DoubleBounce:
            DJHUD.sharedManager.visualViewBackgroundColor = VisualViewColor.black.description
            return DJActivityIndicatorView(type: .DoubleBounce)
        case .FiveDots:
            DJHUD.sharedManager.visualViewBackgroundColor = VisualViewColor.black.description
            return DJActivityIndicatorView(type: .FiveDots)
        case .NineDots:
            DJHUD.sharedManager.visualViewBackgroundColor = VisualViewColor.black.description
            return DJActivityIndicatorView(type: .NineDots)
        case .RotatingSquare:
            DJHUD.sharedManager.visualViewBackgroundColor = VisualViewColor.black.description
            return DJActivityIndicatorView(type: .RotatingSquare)
        case .TriplePulse:
            DJHUD.sharedManager.visualViewBackgroundColor = VisualViewColor.black.description
            return DJActivityIndicatorView(type: .TriplePulse)
        case .BallPulse:
            DJHUD.sharedManager.visualViewBackgroundColor = VisualViewColor.black.description
            return DJActivityIndicatorView(type: .BallPulse)
        case .BallRotateClip:
            DJHUD.sharedManager.visualViewBackgroundColor = VisualViewColor.black.description
            return DJActivityIndicatorView(type: .BallRotateClip)
        case .BallClipRotatePulse:
            DJHUD.sharedManager.visualViewBackgroundColor = VisualViewColor.black.description
            return DJActivityIndicatorView(type: .BallClipRotatePulse)
        case .BallRotateMultiple:
            DJHUD.sharedManager.visualViewBackgroundColor = VisualViewColor.black.description
            return DJActivityIndicatorView(type: .BallRotateMultiple)
        case .BallRotate:
            DJHUD.sharedManager.visualViewBackgroundColor = VisualViewColor.black.description
            return DJActivityIndicatorView(type: .BallRotate)
        }
    }
    
}
