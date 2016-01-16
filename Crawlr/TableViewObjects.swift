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
    
    var description: String {
        return "name: \(name) "
    }
}

struct CrawlItem {
    var bar: Bar;
    var intendedTime: NSDate;
}

struct Crawl {
    //Presumably sorted by order.
    var items: [CrawlItem];
    var name: String;
    var creator: String;
    var createdDate: NSDate;
}
