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
        
    }
    
    func GetBarCrawls(completionBlock: CrawlArrayClosure) {
        let crawls : Array<Crawl> = getCrawls();
        completionBlock(error: nil, list: crawls)
    }
    
    func GetCrawl(crawlId: String, completionBlock: CrawlClosure) {
        completionBlock(error: nil, crawl: getCrawls()[0]);
    }
    
    func getCrawls() -> [Crawl] {
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
                creator: "randomdud",
                createdDate: NSDate(timeIntervalSince1970: 1452326647)
            ),
            
            Crawl(
                items: [
                    CrawlItem(
                        bar:Bar(name: "Wack A Doo's Grub Brew", lat: 28.605199, long: -81.199551),
                        intendedTime: NSDate(timeIntervalSince1970: 1452370560)
                    ),
                    CrawlItem(
                        bar:Bar(name: "ANDAIA'S Brazilian Kitchen & Bar", lat: 28.606065, long: -81.209229),
                        intendedTime: NSDate(timeIntervalSince1970: 1452935943)
                    )
                ],
                name : "Empty-Ass Bar Run",
                creator: "jacobj",
                createdDate: NSDate(timeIntervalSince1970: 1452326347)
            ),
            
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
                    ),
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
                name : "I'm Bad At Choosing Bar Run",
                creator: "jpecoraro342",
                createdDate: NSDate(timeIntervalSince1970: 1452326447)
            ),
        ];
    }
    
}