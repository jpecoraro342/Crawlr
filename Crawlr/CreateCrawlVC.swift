//
//  CreateCrawlVC.swift
//  Crawlr
//
//  Created by Joseph Pecoraro on 1/16/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import UIKit

class CreateCrawlVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var selectedIndexPath: NSIndexPath?;
    
    var listOfBars: Array<Bar> = Array<Bar>();
    var barIsSelected: Array<Bool> = Array<Bool>();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.navigationItem.title = "Bar Crawls";
        
        // TODO: Logout in top Left, Create Meeting in top Right
        let logoutButton = UIBarButtonItem(title: "Logout", style: .Plain, target: self, action: "logoutPressed");
        let createCrawlButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addCrawl");
        
        self.navigationItem.leftBarButtonItem = logoutButton;
        self.navigationItem.rightBarButtonItem = createCrawlButton;
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        loadBarsFromYelp();
    }
    
    // MARK: Data Updates
    
    func loadBarsFromYelp() {
//        Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
//            self.businesses = businesses
//            
//            for business in businesses {
//                print(business.name!)
//                print(business.address!)
//            }
//        }
        
        // TODO: Get Bars
        // TODO: Initialize to false
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
        let cell = tableView.dequeueReusableCellWithIdentifier(CrawlCellIdentifier, forIndexPath: indexPath) as! CrawlCell;
        
        let bar = listOfBars[indexPath.row];
        
        return cell;
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true);
        self.selectedIndexPath = indexPath;
        performSegueWithIdentifier(CrawlListToCrawl, sender: tableView);
    }
    
    // MARK:
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
}
