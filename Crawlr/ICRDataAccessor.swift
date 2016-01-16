//
//  ICRDataAccessor.swift
//  Crawlr
//
//  Created by Joseph Pecoraro on 1/16/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import Foundation

protocol ICRDataAccessor {
    
    // GET
    func GetBarCrawls(completionBlock: CrawlArrayClosure);
    func GetBarsFromCrawl(crawlId: String, completionBlock: BarArrayClosure);
    
    // POST

}