//
//  TableViewObjects.swift
//  Crawlr
//
//  Created by Max Fresonke on 1/16/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import Foundation
import MapKit

struct Bar: CustomStringConvertible {
    var name: String;
    var lat: Double;
    var long: Double;
    var url: String;
    
    var description: String {
        return "name: \(name) "
    }
}

struct CrawlItem {
    var bar: Bar;
    var intendedTime: NSDateComponents;
}

struct Crawl {
    //Presumably sorted by order.
    var items: [CrawlItem];
    var creator: User;
    var createdDate: NSDate;
}

struct User {
    var username: String;
    var name: String;
}