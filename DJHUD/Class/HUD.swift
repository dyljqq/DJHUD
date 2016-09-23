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
}

public class HUD: UIView {
    
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
            return DJHUDCheckMarkView()
        case .Error: break // TODO
        }
        return UIView()
    }
    
}
