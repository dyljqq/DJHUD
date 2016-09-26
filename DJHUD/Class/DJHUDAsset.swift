//
//  DJHUDAsset.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/26.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

class DJHUDAsset {
    
    class var progressActivityImage: UIImage { return DJHUDAsset.bundle(name: "progress_activity") }
    
    class func bundle(name name: String)-> UIImage {
        let bundle = NSBundle(forClass: DJHUDAsset.self)
        let image = UIImage(named: name, inBundle: bundle, compatibleWithTraitCollection: nil)
        return image != nil ? image! : UIImage()
    }
    
}