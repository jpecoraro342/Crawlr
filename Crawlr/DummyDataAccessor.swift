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
    
    let dummyID = "LOLOLOL";
    
    func getCrawls() -> [Crawl] {
        return [
            Crawl(
                name : "Dope-Ass Bar Run",
                location: Location(lat: 28.605199, long: -81.199551),
                creator: User(
                    username: "randomdud",
                    name : "Max Fresonke"
                ),
                bars: [
                    Bar(id: dummyID, name: "Wack A Doo's Grub Brew", location: Location(lat: 28.605199, long: -81.199551)),
                    Bar(id: dummyID, name: "ANDAIA'S Brazilian Kitchen & Bar", location: Location(lat: 28.606065, long: -81.209229)),
                    Bar(id: dummyID, name: "Bar Louie", location: Location(lat: 28.598454, long: -81.208328)),
                    Bar(id: dummyID, name: "The Knight's Pub", location: Location(lat: 28.596344, long: -81.208435))
                ]
            ),
            
            Crawl(
                name : "Empty-Ass Bar Run",
                location: Location(lat: 28.605199, long: -81.199551),
                creator: User(
                    username: "jacobj",
                    name : "Jacob Jenkins"
                ),
                bars: [
                    Bar(id: dummyID, name: "Wack A Doo's Grub Brew", location: Location(lat: 28.605199, long: -81.199551)),
                    Bar(id: dummyID, name: "ANDAIA'S Brazilian Kitchen & Bar", location: Location(lat: 28.606065, long: -81.209229))
                ]
            ),
            
            Crawl(
                name : "I'm Bad At Choosing Bar Run",
                location: Location(lat: 28.605199, long: -81.199551),
                creator: User(
                    username: "jpecoraro342",
                    name : "Joseph Pecoraro"
                ),
                bars: [
                    Bar(id: dummyID, name: "Wack A Doo's Grub Brew", location: Location(lat: 28.605199, long: -81.199551)),
                    Bar(id: dummyID, name: "ANDAIA'S Brazilian Kitchen & Bar", location: Location(lat: 28.606065, long: -81.209229)),
                    Bar(id: dummyID, name: "Bar Louie", location: Location(lat: 28.598454, long: -81.208328)),
                    Bar(id: dummyID, name: "The Knight's Pub", location: Location(lat: 28.596344, long: -81.208435)),
                    Bar(id: dummyID, name: "Wack A Doo's Grub Brew", location: Location(lat: 28.605199, long: -81.199551)),
                    Bar(id: dummyID, name: "ANDAIA'S Brazilian Kitchen & Bar", location: Location(lat: 28.606065, long: -81.209229)),
                    Bar(id: dummyID, name: "Bar Louie", location: Location(lat: 28.598454, long: -81.208328)),
                    Bar(id: dummyID, name: "The Knight's Pub", location: Location(lat: 28.596344, long: -81.208435))
                ]
            ),
        ];
    }
    
}