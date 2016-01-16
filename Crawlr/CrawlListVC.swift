//
//  CrawlListVC.swift
//  Crawlr
//
//  Created by Joseph Pecoraro on 1/16/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import UIKit

class CrawlListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataAccessor: ICRDataAccessor = DummyDataAccessor();
    
    var refreshControl: UIRefreshControl = UIRefreshControl();
    var selectedIndexPath: NSIndexPath?;
    
    var listOfBarCrawls: Array<Crawl> = Array<Crawl>();
    
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
        
        setupRefreshControl();
        self.refreshControl.beginRefreshing();
        loadCrawlItems();
    }
    
    // MARK: Refresh Control
    
    func setupRefreshControl() {
        let tableViewController = UITableViewController();
        tableViewController.tableView = self.tableView;
        
        self.refreshControl = UIRefreshControl();
        self.refreshControl.addTarget(self, action: "loadCrawlItems", forControlEvents: UIControlEvents.ValueChanged);
        
        tableViewController.refreshControl = self.refreshControl;
    }
    
    // MARK: Data Updates
    
    func loadCrawlItems() {
        dataAccessor.GetBarCrawls{ (error, crawlList) in
            if (error == nil) {
                self.listOfBarCrawls = crawlList!;
                self.tableView.reloadData();
            }
            else {
                //TODO: Handle error on the UI
            }
            
            self.refreshControl.endRefreshing();
        };
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
        return listOfBarCrawls.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CrawlCellIdentifier, forIndexPath: indexPath) as! CrawlCell;
        
        let crawl = listOfBarCrawls[indexPath.row];
        
        cell.crawlName.text = crawl.name;
        cell.crawlAuthor.text = crawl.creator.username;
        
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
        if segue.identifier == CrawlListToCrawl {
            let crawlVC = segue.destinationViewController as! CrawlVC;
            crawlVC.crawl = self.listOfBarCrawls[self.selectedIndexPath!.row];
            crawlVC.dataAccessor = self.dataAccessor;
        }
    }
}
