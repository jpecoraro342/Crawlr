//
//  CrawlVC.swift
//  Crawlr
//
//  Created by Joseph Pecoraro on 1/16/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import UIKit
import MapKit

class CrawlVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!;
    @IBOutlet weak var map: MKMapView!;
    
    var listOfBars: Array<Bar> = Array<Bar>();
    var crawl: Crawl?;
    
    var dataAccessor: ICRDataAccessor?;
    
    var refreshControl: UIRefreshControl = UIRefreshControl();
    var selectedIndexPath: NSIndexPath?;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.navigationItem.title = crawl?.name;
        
        // TODO: Logout in top Left, Create Meeting in top Right
        let mapViewButton = UIBarButtonItem(title: "View Map", style: .Plain, target: self, action: "viewMap");
        
        self.navigationItem.rightBarButtonItem = mapViewButton;
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        setupRefreshControl();
        self.refreshControl.beginRefreshing();
        loadBarList();
        
        setupMap();
    }
    
    // MARK: Refresh Control
    
    
    func setupRefreshControl() {
        let tableViewController = UITableViewController();
        tableViewController.tableView = self.tableView;
        
        self.refreshControl = UIRefreshControl();
        self.refreshControl.addTarget(self, action: "loadBarList", forControlEvents: UIControlEvents.ValueChanged);
        
        tableViewController.refreshControl = self.refreshControl;
    }
    
    // MARK: Data Updates
    
    func loadBarList() {
        dataAccessor!.GetCrawl("barcrawl1", completionBlock: { (error, barCrawl) in
            if (error == nil) {
                self.crawl = barCrawl!;
                
                self.listOfBars = self.crawl!.bars;
                
                self.tableView.reloadData();
            }
            else {
                //TODO: Handle error on the UI
            }
            
            self.refreshControl.endRefreshing();
        });
    }
    
    // MARK: UITableViewDataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    //    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        switch section {
    //        default:
    //            return "";
    //        }
    //    }
    
    //    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return 40;
    //    }
    
    //    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //        let headerView = ();
    //        headerView.backgroundColor = tableView.backgroundColor;
    //        headerView.titleLabel?.text = self.tableView(tableView, titleForHeaderInSection: section);
    //
    //        return headerView;
    //    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfBars.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(BarCellIdentifier, forIndexPath: indexPath) as! BarCell;
        
        let bar = listOfBars[indexPath.row];
        
        cell.barName.text = bar.name;
        // cell.summaryLabel.text = crawl.summary;
        
        return cell;
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true);
        self.selectedIndexPath = indexPath;
        performSegueWithIdentifier("TODO: Insert Identifier", sender: tableView);
    }
    
    // Map Stuff
    
    func setupMap() {
        self.map.showsUserLocation = true;
        let initialLocation = User.currentUser.currentLocation;
        for bar in listOfBars {
            var location = CLLocationCoordinate2D(
                latitude: bar.lat,
                longitude: bar.long
            );
            var annotation = MKPointAnnotation()
            annotation.coordinate = location;
            annotation.title = bar.name;
            self.map.addAnnotation(annotation);
        }
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 1000;
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0);
        map.setRegion(coordinateRegion, animated: true);
    }
    
}
