//
//  DJHUDAnimatingProtocol.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/23.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import Foundation

@objc protocol DJHUDAnimating {
    
    /// start animate
    func startAnimating()
    
    /// stop animate
    optional func stopAnimating()
}