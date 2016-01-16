//
//  CreateCrawlVC.swift
//  Crawlr
//
//  Created by Joseph Pecoraro on 1/16/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import UIKit
import Foundation

class CreateCrawlVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var crawlNameTextField: UITextField!
    
    var selectedIndexPath: NSIndexPath?;
    
    var listOfBars: Array<Bar> = Array<Bar>();
    var barIsSelected: Dictionary<String, Bool> = Dictionary<String, Bool>();
    
    var refreshControl: UIRefreshControl = UIRefreshControl();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.navigationItem.title = "Create Crawl";
        
        // TODO: Logout in top Left, Create Meeting in top Right
    
        let createCrawlButton = UIBarButtonItem(title: "Create", style: .Plain, target: self, action: "createCrawl");
        
        self.navigationItem.rightBarButtonItem = createCrawlButton;
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        setupRefreshControl();
        self.refreshControl.beginRefreshing();
        loadBarsFromYelp();
    }
    
    // MARK: Refresh Control
    
    func setupRefreshControl() {
        let tableViewController = UITableViewController();
        tableViewController.tableView = self.tableView;
        
        self.refreshControl = UIRefreshControl();
        self.refreshControl.addTarget(self, action: "loadBarsFromYelp", forControlEvents: UIControlEvents.ValueChanged);
        
        tableViewController.refreshControl = self.refreshControl;
    }
    
    // MARK: Data Updates
    
    func loadBarsFromYelp() {
        Business.searchWithTerm("Bars", sort: .Distance, categories: nil, deals: false) { (businesses: [Business]!, error: NSError!) -> Void in
            self.listOfBars = Array<Bar>();
            self.barIsSelected = Dictionary<String, Bool>();
            
            for business in businesses {
                // print(business.name!)
                // print(business.address!)
                
                let newBar = Bar(id: "none", name: business.name, location: Location(lat: business.latitude!, long: business.longitude!));
                self.listOfBars.append(newBar);
                self.barIsSelected.updateValue(false, forKey: newBar.name!);
            }
            
            self.tableView.reloadData();
        }
        
        self.refreshControl.endRefreshing();
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
        let cell = tableView.dequeueReusableCellWithIdentifier(CreateCrawlBarIdentifier, forIndexPath: indexPath) as! YelpBarCell;
        
        let bar = listOfBars[indexPath.row];
        cell.barNameLabel.text = bar.name;
        cell.checkMarkImageView.hidden = !barIsSelected[bar.name!]!;
        
        return cell;
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true);
        self.selectedIndexPath = indexPath;
        
        let bar = listOfBars[indexPath.row];
        barIsSelected[bar.name!] = !barIsSelected[bar.name!]!;
        self.tableView.reloadData();
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01;
    }
    
    func createCrawl() {
        var listOfSelectedBars = Array<Bar>();
        
        for bar in self.listOfBars {
            if (barIsSelected[bar.name!]!) {
                listOfSelectedBars.append(bar);
            }
        }
        
        let crawl = Crawl(
            id: "testID",
            name : self.crawlNameTextField.text!,
            location: Location(lat: listOfSelectedBars[0].location!.lat, long: listOfSelectedBars[0].location!.long),
            creator:  "Anonymous",
            bars: listOfSelectedBars
        );
        
        User.currentUser.globalCrawlAdditions.append(crawl);
        
        self.navigationController?.popViewControllerAnimated(true);
        
//        let parameters = [
//            "name": self.crawlNameTextField,
//            "created" : NSDate(),
//            "bars": []
//        ];
//        
//        let parameters = [
//            "name": self.crawlNameTextField,
//            "created" : NSDate(),
//            "bars": []
//        ];
//
//        
//        Alamofire.request(.POST, "https://httpbin.org/post", parameters: parameters) {
//            
//        }
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true;
    }
    
    @IBAction func textFieldEditingBegin(sender: AnyObject) {
        
    }
    
    // MARK:
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
}
