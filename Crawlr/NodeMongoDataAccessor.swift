//
//  NodeMongoDataAccessor.swift
//  Crawlr
//
//  Created by Joseph Pecoraro on 1/16/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import Foundation
import Alamofire

class NodeMongoDataAccessor: NSObject, ICRDataAccessor {
    
    let baseURL = "https://32f68be0.ngrok.com";
    
    // GET
    func GetBarCrawls(completionBlock: CrawlArrayClosure) {
        Alamofire.request(.GET, URLStringWithExtension("crawls"))
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
//                print(response.data)     // server data
                print(response.result)   // result of response serialization
                var crawls : [Crawl] = [Crawl]();
                if let JSON = response.result.value {
                    print(JSON);
                    for jCrawl in JSON as! Array<Dictionary<String, AnyObject>> {
                        crawls.append(self.parseCrawl(jCrawl));
                    }
                    completionBlock(error: nil, list: crawls);
                    
                }
                else {
                    completionBlock(error: response.result.error, list: Array<Crawl>());
                }
        }
    }
    
    func idBars(idBars : [String]) -> [Bar] {
        var bars : [Bar] = [Bar]();
        for idBar in idBars {
            let bar = Bar(
                id: idBar,
                name: nil,
                location: nil
            );
            bars.append(bar);
        }
        return bars;
    }
    
    func fullBars(jBars : [Dictionary<String, AnyObject>]) -> [Bar] {
        var bars : [Bar] = [Bar]();
        for jBar in jBars {
            //check for location
            let location = parseLocation(jBar);
            let bar = Bar(
                id: jBar["_id"] as! String,
                name: jBar["name"] as? String,
                location: location
            );
            bars.append(bar);
        }
        return bars;
    }
    
    func parseCrawl(jCrawl: Dictionary<String, AnyObject>) -> Crawl {
        var bars : [Bar] = [Bar]();
        if let idBars = jCrawl["bars"] as? [String] {
            bars = self.idBars(idBars);
        } else {
            bars = self.fullBars(jCrawl["bars"] as! [Dictionary<String, AnyObject>]);
        }
        
        let location = parseLocation(jCrawl["firstBar"] as! Dictionary<String, AnyObject>);
        let creator = (jCrawl["creator"] as! Dictionary<String, AnyObject>)["username"] as! String;
        let crawl = Crawl(
            id: jCrawl["_id"] as! String,
            name: jCrawl["name"] as! String,
            location: location!,
            creator: creator,
            bars: bars
        )
        return crawl;
    }
    
    func parseLocation(json: Dictionary<String, AnyObject>) -> Location? {
        var location : Location? = nil;
        if json["lat"] != nil && json["long"] != nil {
            location = Location(
                lat: json["lat"] as! Double,
                long: json["long"] as! Double
            )
        }
        return location;
    }
    
    func GetCrawl(crawlId: String, completionBlock: CrawlClosure) {
        Alamofire.request(.GET, URLStringWithExtension("crawls/\(crawlId)"))
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result.value)   // result of response serialization
                print("Crawl ID: \(crawlId)");
                if let json = response.result.value as? Dictionary<String, AnyObject> {
                    print("\nJSON: \(json)\n")
                    completionBlock(error: nil, crawl: self.parseCrawl(json));
                    
                }
                else {
                    completionBlock(error: response.result.error, crawl: nil);
                }
        }
    }
    
    // POST
    
    func URLStringWithExtension(urlExtension: String) -> String {
        return "\(baseURL)/\(urlExtension)";
    }

}
