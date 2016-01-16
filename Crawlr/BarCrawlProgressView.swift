//
//  BarCrawlProgressView.swift
//  Crawlr
//
//  Created by Joseph Pecoraro on 1/16/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import UIKit

class BarCrawlProgressView: UIView {

    var numberOfBars: Int = 0;
    let maxNumberOfBars = 6;
    
    var widthPerBar : Double = 0;
    
    init(frame: CGRect, numberOfBars: Int) {
        super.init(frame: frame);
        self.numberOfBars = numberOfBars;
        setupView();
    }
    
    convenience override init(frame: CGRect) {
        self.init(frame: frame, numberOfBars: 0);
    }
    
    convenience init() {
        self.init(frame: CGRectZero);
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        setupView();
    }
    
    func setupView() {
        let width = frame.size.width;
        var barWidth = Double(width - 20);
        
        self.widthPerBar = barWidth / Double(maxNumberOfBars - 1);
        
        if (self.numberOfBars <= maxNumberOfBars) {
            barWidth = widthPerBar * Double(self.numberOfBars - 1);
        }
        
        if (self.numberOfBars == 0) {
            barWidth = 0;
        }
        
        let barView = UIView(frame: CGRectMake(10, 7, CGFloat(barWidth), frame.size.height - 14));
        barView.backgroundColor = blueLight1;
        
        self.addSubview(barView);
        
        for index in (0..<self.numberOfBars) {
            self.addSubview(getNode(Double(index)*widthPerBar, displayNum: index));
        }
    }
    
    func getNode(distance: Double, displayNum: Int) -> UIView {
        let node = UIView(frame: CGRectMake(CGFloat(distance), 0, 20, 20));
        node.backgroundColor = blueDark1;
        
        let numberLabel = UILabel(frame: CGRectMake(0, 0, 20, 20));
        numberLabel.text = "\(displayNum + 1)";
        numberLabel.textAlignment = NSTextAlignment.Center;
        numberLabel.textColor = offWhiteColor;
        
        node.addSubview(numberLabel);
        
        return node;
    }
    
}
