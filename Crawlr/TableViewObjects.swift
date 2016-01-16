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
    var id: String;
    var name: String?;
    var location: Location?;
    var description: String {
        return "name: \(name) "
    }
}

struct Location {
    var lat: Double;
    var long: Double;
}

struct Crawl {
    var name: String;
    var location: Location;
    var creator: User;
    //Presumably sorted by order.
    var bars: [Bar];
}

struct User {
    var username: String;
    var name: String?;
}