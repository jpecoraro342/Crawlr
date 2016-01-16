//
//  Constants.swift
//  Crawlr
//
//  Created by Joseph Pecoraro on 1/16/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import UIKit

// MARK: Closure Defines

typealias ErrorClosure = (error: NSError?) -> Void;
typealias BooleanClosure = (success: Bool) -> Void;
typealias CrawlArrayClosure = (error: NSError?, list: Array<Crawl>?) -> Void;
typealias CrawlClosure = (error: NSError?, crawl: Crawl?) -> Void;
typealias BarArrayClosure = (error: NSError?, list: Array<Bar>?) -> Void;
typealias ImageClosure = (error: NSError?, image: UIImage?) -> Void;
typealias JsonClosure = (error: NSError?, jsonData: AnyObject?) -> Void;
typealias DataClosure = (error: NSError?, data: NSData?) -> Void;
typealias StringClosure = (error: NSError?, string: String?) -> Void;

// MARK: Color Scheme

let blueLight1 = UIColor(hexString: "65a5d1");
let blueLight2 = UIColor(hexString: "3e94d1");
let blue1 = UIColor(hexString: "0a64a4");
let blueDark1 = UIColor(hexString: "24577b");
let blueDark2 = UIColor(hexString: "03406a");

let offWhiteColor = UIColor(hexString: "fefefe");

let buttonNormalColor = blue1;
let buttonHighlightedColor = blueDark2;

let shadowColor = blueLight1;

let navigationBarColor = blue1;

// MARK: Segues

let CrawlListToCrawl = "CrawlListToCrawl";
let CrawlListToAddCrawl = "CrawlListToAddCrawl";

// MARK: Reuse Identifiers

let CrawlCellIdentifier = "CrawlCellIdentifier";
let BarCellIdentifier = "BarCellIdentifier";
let CreateCrawlBarIdentifier = "CreateCrawlBarIdentifier";

// MARK: Global Crawl Additions

var globalCrawlAdditions = Array<Crawl>();



