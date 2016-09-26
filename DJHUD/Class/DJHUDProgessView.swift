//
//  DJHUDProgessView.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/26.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

public class DJHUDProgessView: DJHUDBaseView {
    
    public init(title: String? = nil, subtitle: String? = nil) {
        super.init(image: DJHUDAsset.progressActivityImage, title: title, subtitle: subtitle)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DJHUDProgessView: DJHUDAnimating {
    func startAnimating() {
        imageView.layer.addAnimation(DJHUDAnimation.discreteRotation, forKey: "DJHUDProgessView")
    }
    
    func stopAnimating() {
        
    }
}
