//
//  DJHUD.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/23.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

public typealias TargetAction = Bool-> Void

public class DJHUD: NSObject {
    
    // Singleton must write like this
    private struct Constants {
        static let sharedHUD = DJHUD()
    }
    
    public class var sharedManager: DJHUD {
        return Constants.sharedHUD
    }
    
    private let window = Window()
    
    public var visualViewBackgroundColor: UIColor = VisualViewColor.white.description {
        didSet {
            window.visualView.backgroundColor = visualViewBackgroundColor
        }
    }
    
    public override init() {
        super.init()
        
        window.visualView.autoresizingMask = [.FlexibleBottomMargin, .FlexibleTopMargin, .FlexibleLeftMargin, .FlexibleRightMargin]
    }
    
    public var isVisual: Bool {
        return !window.hidden
    }
    
    public var dismissBackgroundView = true
    
    public var contentView: UIView {
        get {
            return window.visualView.content
        }
        set {
            window.visualView.content = newValue
            startAnimatingContentView()
        }
    }
    
    public func show() {
        window.show()
        if dismissBackgroundView {
            window.hideBackgroundView(true)
        } else {
            window.showBackgroundView(true)
        }
        startAnimatingContentView()
    }
    
    public func hide(anim anim: Bool, completion: TargetAction? = nil) {
        window.hide(anim: anim, completion: completion)
        stopAnimatingContentView()
    }
    
    public func hide(afterDelay: Double, anim: Bool, completion: TargetAction? = nil) {
        delay(afterDelay, closure: {
            self.hide(anim: true)
        })
    }
    
    func startAnimatingContentView() {
        if isVisual && contentView.conformsToProtocol(DJHUDAnimating) {
            (contentView as? DJHUDAnimating)?.startAnimating()
        } else if let contentView = contentView as? DJActivityIndicatorView {
            contentView.startAnimation()
        }
    }
    
    func stopAnimatingContentView() {
        if contentView.conformsToProtocol(DJHUDAnimating) {
            (contentView as? DJHUDAnimating)?.stopAnimating?()
        }
    }
    
}
