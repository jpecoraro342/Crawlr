//
//  LocationUpdaterDelegate.swift
//  Crawlr
//
//  Created by Joseph Pecoraro on 1/16/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import Foundation
import MapKit

protocol LocationUpdaterDelegate {
    func didUpdateLocation(newLocation: CLLocation);
}
