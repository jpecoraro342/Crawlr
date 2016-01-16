//
//  DummyDataAccessor.swift
//  Crawlr
//
//  Created by Joseph Pecoraro on 1/16/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import Foundation

class DummyDataAccessor: NSObject, ICRDataAccessor {
    
    override init() {
        super.init();
        
        initCrawls();
    }
    
    func GetBarCrawls(completionBlock: CrawlArrayClosure) {
        let crawls : [Crawl] = [ baseCrawl() ];
        completionBlock(error: nil, list: crawls)
    }
    
    func GetBarsFromCrawl(crawlId: String, completionBlock: BarArrayClosure) {
        
    }
    
    func initCrawls() {

    }
    
}

func baseCrawls() -> [Crawl] {
    return [
        Crawl(
            items: [
                CrawlItem(
                    bar:Bar(name: "Wack A Doo's Grub Brew", lat: 28.605199, long: -81.199551),
                    intendedTime: NSDate(timeIntervalSince1970: 1452370560)
                ),
                CrawlItem(
                    bar:Bar(name: "ANDAIA'S Brazilian Kitchen & Bar", lat: 28.606065, long: -81.209229),
                    intendedTime: NSDate(timeIntervalSince1970: 1452935943)
                ),
                CrawlItem(
                    bar:Bar(name: "Bar Louie", lat: 28.598454, long: -81.208328),
                    intendedTime: NSDate(timeIntervalSince1970: 1452370760)
                ),
                CrawlItem(
                    bar:Bar(name: "The Knight's Pub", lat: 28.596344, long: -81.208435),
                    intendedTime: NSDate(timeIntervalSince1970: 1452370260)
                )
            ],
            name : "Dope-Ass Bar Run",
            creator: User(
                username: "randomdud",
                name : "Max Fresonke"
            ),
            createdDate: NSDate(timeIntervalSince1970: 1452326647)
        ),
        
        Crawl(
            items: [],
            name : "Empty-Ass Bar Run",
            creator: User(
                username: "jacobj",
                name : "Jacob Jenkins"
            ),
            createdDate: NSDate(timeIntervalSince1970: 1452326347)
        ),
        
        Crawl(
            items: [],
            name : "I'm Bad At Choosing Bar Run",
            creator: User(
                username: "jpecoraro342",
                name : "Joseph Pecoraro"
            ),
            createdDate: NSDate(timeIntervalSince1970: 1452326447)
        ),
    ];
}