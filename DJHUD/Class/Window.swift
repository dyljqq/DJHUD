//
//  Window.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/23.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

typealias completionCallback = (finished: Bool)-> ()

class Window: UIWindow {
    
    let visualView: VisualView
    init(visualView: VisualView = VisualView()) {
        self.visualView = visualView
        super.init(frame: UIApplication.sharedApplication().delegate!.window!!.bounds)
        setup()
    }
    
    private func setup() {
        rootViewController = UIViewController()
        windowLevel = UIWindowLevelNormal + 500
        backgroundColor = clearColor
        
        addSubview(backgroundView)
        addSubview(visualView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backgroundView.frame = bounds
        visualView.center = center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func show() {
        layer.removeAllAnimations()
        
        makeKeyAndVisible()
        
        visualView.alpha = 1.0
        visualView.center = center
        
        hidden = false
    }
    
    func hide(anim anim: Bool, completion: completionCallback? = nil) {
        let finalize: completionCallback = { finished in
            self.hidden = true
            self.resignKeyWindow()
        }
        
        if hidden { return }
        
        if anim {
            UIView.animateWithDuration(0.8, animations: {
                self.visualView.alpha = 0
                self.hideBackgroundView(true)
            }, completion: { finish in
                finalize(finished: true)
            })
        } else {
            visualView.alpha = 0
            hideBackgroundView(true)
            finalize(finished: true)
        }
    }
    
    func showBackgroundView(anim: Bool) {
        if anim {
            UIView.animateWithDuration(0.175) {
                self.backgroundView.alpha = 1.0
            }
        } else {
            self.backgroundView.alpha = 1.0
        }
    }
    
    func hideBackgroundView(anim: Bool) {
        if anim {
            UIView.animateWithDuration(0.175) {
                self.backgroundView.alpha = 0.0
            }
        } else {
            self.backgroundView.alpha = 0.0
        }
    }
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.25)
        view.alpha = 0
        return view
    }()
    
}



