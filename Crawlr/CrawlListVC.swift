//
//  CrawlListVC.swift
//  Crawlr
//
//  Created by Joseph Pecoraro on 1/16/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import UIKit

class CrawlListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataAccessor: ICRDataAccessor?;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.navigationItem.title = "Bar Crawls";
    }
    
}
