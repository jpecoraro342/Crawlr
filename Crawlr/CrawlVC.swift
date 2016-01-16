//
//  CrawlVC.swift
//  Crawlr
//
//  Created by Joseph Pecoraro on 1/16/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import UIKit

class CrawlVC: UIViewController {
    
    let barList: Array<Bar> = Array<Bar>();
    let crawl: Crawl = Crawl(items: [], name: "Super Crawl", creator: User(username: "username", name: "name"), createdDate: NSDate());
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.navigationController?.title = crawl.name;
        
    }

}
