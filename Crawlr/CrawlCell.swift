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
    @IBOutlet weak var crawlName: UILabel!
    
    @IBOutlet weak var crawlAuthor: UILabel!
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        cellBackground.setSelectingState(highlighted);
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        cellBackground.setSelectingState(selected);
    }
    
}
