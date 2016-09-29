//
//  VisualView.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/23.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

// VisualView's background color
enum VisualViewColor {
    case white
    case black
    case red
    
    var description: UIColor {
        switch self {
        case .white: return UIColor(white: 0.8, alpha: 0.36)
        case .black: return UIColor(white: 0, alpha: 0.5)
        case .red: return RGB(red: 237, green: 85, blue: 101)
        }
    }
}

class VisualView: UIVisualEffectView {

    override init(effect: UIVisualEffect?) {
        super.init(effect: UIBlurEffect(style: .Light))
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        backgroundColor = VisualViewColor.black.description
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
        
        contentView.addSubview(self.content)
        
        let offset = 20
        
        let interpolatingMotionX = UIInterpolatingMotionEffect(keyPath: DJAnimationKeyPath.center_x, type: .TiltAlongHorizontalAxis)
        interpolatingMotionX.maximumRelativeValue = offset
        interpolatingMotionX.minimumRelativeValue = -offset
        
        let interpolatingMotionY = UIInterpolatingMotionEffect(keyPath: DJAnimationKeyPath.center_y, type: .TiltAlongHorizontalAxis)
        interpolatingMotionY.maximumRelativeValue = offset
        interpolatingMotionY.minimumRelativeValue = -offset
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [interpolatingMotionX, interpolatingMotionY]
        
        addMotionEffect(group)
    }
    
    private var _content = UIView()
    var content: UIView {
        get {
            return _content
        }
        set {
            _content.removeFromSuperview()
            
            _content = newValue
            _content = newValue
            _content.alpha = 0.85
            _content.clipsToBounds = true
            
            _content.contentMode = .Center
            frame.size = _content.bounds.size
            
            contentView.addSubview(_content)
        }
    }
    
}
