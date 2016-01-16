//
//  DummyDataAccessor.swift
//  Crawlr
//
//  Created by Joseph Pecoraro on 1/16/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import Foundation

class DummyDataAccessor: NSObject, ICRDataAccessor {
    
    static var barListForCrawl: Dictionary<String, Array<CrawlItem> > = Dictionary<String, Array<CrawlItem> >(); // Change String
    static var crawlDictionary: Dictionary<String, Crawl> = Dictionary<String, Crawl>();
    
    override init() {
        super.init();
        
        initCrawls();
    }
    
    func GetBarCrawls(completionBlock: CrawlArrayClosure) {
        let crawlsAsArray = Array(DummyDataAccessor.crawlDictionary.values);
        completionBlock(error: nil, list: crawlsAsArray);
    }
    
    func GetCrawl(crawlId: String, completionBlock: CrawlClosure) {
        
    }
    
    func initCrawls() {

    }
    
}