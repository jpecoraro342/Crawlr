//
//  CrawlCell.swift
//  Crawlr
//
//  Created by Joseph Pecoraro on 1/16/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import UIKit

class CrawlCell: UITableViewCell {
    
    @IBOutlet weak var cellBackground: CRCellBackground!
    
    var progressView: BarCrawlProgressView?;
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        cellBackground.setSelectingState(highlighted);
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        cellBackground.setSelectingState(selected);
    }
    
    func setCrawlProgressView (crawlView: BarCrawlProgressView) {
        if let progress = progressView {
            progress.removeFromSuperview();
        }
        
        self.progressView = nil;
        self.progressView = crawlView;
        self.addSubview(progressView!);
    }
    
}
