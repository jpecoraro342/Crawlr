//
//  CRCellBackground.swift
//  Crawlr
//
//  Created by Joseph Pecoraro on 1/16/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import UIKit

class CRCellBackground: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    func configure() {
        layer.borderColor = blue1.CGColor;
        addShadow();
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        backgroundColor = UIColor.whiteColor();
        addShadow();
    }
    
    func addShadow() {
        layer.shadowPath = UIBezierPath(rect: layer.bounds).CGPath;
        layer.shadowColor = UIColor.grayColor().CGColor;
        layer.shadowOpacity = 0.8;
        layer.shadowRadius = 3;
        layer.shadowOffset = CGSizeMake(0, 1);
    }
    
    func setSelectingState(isSelected: Bool) {
        if (isSelected) {
            layer.shadowColor = blue1.CGColor;
            layer.shadowRadius = 5;
            layer.borderWidth = 0.5;
        }
        else {
            layer.shadowColor = UIColor.grayColor().CGColor;
            layer.shadowRadius = 3;
            layer.borderWidth = 0;
        }
    }
}