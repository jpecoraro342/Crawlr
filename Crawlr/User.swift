//
//  User.swift
//  Crawlr
//
//  Created by Joseph Pecoraro on 1/16/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import Foundation
import MapKit

class User : NSObject, CLLocationManagerDelegate {
    static let currentUser = User();
    
    let manager = CLLocationManager();
    
    var id: String?;
    var username: String?;
    var name: String?;
    
    var currentLocation: CLLocation = CLLocation(latitude: 0, longitude: 0);
    
    override init() {
        super.init();
        
        let lat = NSUserDefaults.standardUserDefaults().doubleForKey("latitude");
        let lon = NSUserDefaults.standardUserDefaults().doubleForKey("longitude");
        
        self.currentLocation = CLLocation(latitude: lat, longitude: lon);
        
        startScanningForLocation();
    }
    
    func login() {
        // TODO:
    }
    
    func logout() {
        // TODO:
    }
    
    // All the core location stuff
    
    func startScanningForLocation() {
        manager.delegate = self;
        
        if CLLocationManager.authorizationStatus() == .NotDetermined {
            manager.requestWhenInUseAuthorization();
        }
        else {
            manager.startUpdatingLocation();
        }
    }
    
    func locationManager(manager: CLLocationManager,
        didChangeAuthorizationStatus status: CLAuthorizationStatus) {
            
            switch CLLocationManager.authorizationStatus() {
            case .AuthorizedAlways, .AuthorizedWhenInUse:
                manager.startUpdatingLocation();
            case .NotDetermined:
                manager.requestAlwaysAuthorization()
            case .Restricted, .Denied:
                let alertController = UIAlertController(
                    title: "Background Location Access Disabled",
                    message: "In order to be notified about adorable kittens near you, please open this app's settings and set location access to 'Always'.",
                    preferredStyle: .Alert)
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
                alertController.addAction(cancelAction)
                
                let openAction = UIAlertAction(title: "Open Settings", style: .Default) { (action) in
                    if let url = NSURL(string:UIApplicationOpenSettingsURLString) {
                        UIApplication.sharedApplication().openURL(url)
                    }
                }
                alertController.addAction(openAction)
                
                // self.presentViewController(alertController, animated: true, completion: nil)
            }
            
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("\(locations)");
        self.currentLocation = locations[0];
    }
}