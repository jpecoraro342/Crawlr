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
    
    let baseURL = "https://7db109f2.ngrok.com";
    
    // GET
    func GetBarCrawls(completionBlock: CrawlArrayClosure) {
        Alamofire.request(.GET, URLStringWithExtension("crawls"))
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                var crawls : [Crawl] = [Crawl]();
                if let JSON = response.result.value {
                    print("\nJSON: \(JSON)\n")
                    for jCrawl in JSON as! Array<Dictionary<String, AnyObject>> {
                        //Extract the firstBar for convienence
                        let firstBar = jCrawl["firstBar"] as! Dictionary<String, AnyObject>;
                        //Extract the array of bar IDs and turn them into an array of Bars.
                        let barIDs = jCrawl["bars"] as! [String];
                        let creator = jCrawl["creator"] as! Dictionary<String, AnyObject>;
                        var bars = [Bar]();
                        for barID in barIDs {
                            var bar : Bar = Bar(id: barID, name: nil, location: nil);
                            bar.id = barID;
                            bars.append(bar);
                        }
                        //Create the final crawl object.
                        let crawl : Crawl = Crawl(
                            name: jCrawl["name"] as! String,
                            location: Location(
                                lat: firstBar["lat"] as! Double,
                                long: firstBar["long"] as! Double
                            ),
                            creator: User(username: creator["username"] as! String, name: nil),
                            bars: bars
                        );
                        crawls.append(crawl);
                    }
                    completionBlock(error: nil, list: crawls);
                    
                }
                else {
                    completionBlock(error: response.result.error, list: Array<Crawl>());
                }
        }
    }
    
    func GetCrawl(crawlId: String, completionBlock: CrawlClosure) {
        Alamofire.request(.GET, URLStringWithExtension("crawls"), parameters: ["crawlId": crawlId])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("\nJSON: \(JSON)\n")
                    // TODO: Convert into Crawl
                    
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
