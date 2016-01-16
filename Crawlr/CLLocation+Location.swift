//
//  CLLocation+Location.swift
//  Crawlr
//
//  Created by Joseph Pecoraro on 1/16/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import MapKit

extension CLLocation {
    convenience init(crLocation: Location) {
        self.init(latitude: crLocation.lat, longitude: crLocation.long);
    }
}
