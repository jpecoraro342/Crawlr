//
//  YelpBarCell.swift
//  Crawlr
//
//  Created by Joseph Pecoraro on 1/16/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import UIKit

class YelpBarCell: UITableViewCell {
    @IBOutlet weak var cellBackground: CRCellBackground!
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        cellBackground.setSelectingState(highlighted);
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        cellBackground.setSelectingState(selected);
    }

}
