//
//  DJHUDBaseView.swift
//  DJHUD
//
//  Created by 季勤强 on 16/9/23.
//  Copyright © 2016年 季勤强. All rights reserved.
//

import UIKit

public class DJHUDBaseView: UIView {
    
    private struct Constant {
        static let minimumScale: CGFloat = 0.25
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public init(image: UIImage? = nil, title: String? = "", subtitle: String? = nil) {
        super.init(frame: defaultFrame)
        
        imageView.image = image
        titleLabel.text = title
        subtitleLabel.text = subtitle
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.frame = CGRect(origin: CGPointZero, size: CGSizeMake(bounds.width, heightBy(scale: 1)))
        imageView.frame = CGRect(origin: CGPointMake(0, titleLabel.dj_yh), size: CGSizeMake(bounds.width, heightBy(scale: 2)))
        subtitleLabel.frame = CGRect(origin: CGPointMake(0, imageView.dj_yh), size: CGSizeMake(bounds.width, heightBy(scale: 1)))
    }
    
    private func heightBy(scale scale: CGFloat)-> CGFloat {
        return CGFloat(ceil(bounds.height / 4 * scale))
    }
    
    public let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.alpha = DJAlpha
        imageView.contentMode = .Center
        return imageView
    }()
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = blackColor.colorWithAlphaComponent(DJAlpha)
        label.font = UIFont.boldSystemFontOfSize(17)
        label.textAlignment = .Center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = Constant.minimumScale
        return label
    }()
    
    public let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = blackColor.colorWithAlphaComponent(0.7)
        label.font = UIFont.systemFontOfSize(14)
        label.textAlignment = .Center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = Constant.minimumScale
        return label
    }()
    
}
