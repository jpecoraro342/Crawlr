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
    
    let baseURL = "https://crawlr.io";
    
    // GET
    func GetBarCrawls(completionBlock: CrawlArrayClosure) {
        Alamofire.request(.GET, URLStringWithExtension("Crawl"))
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("\nJSON: \(JSON)\n")
                    // TODO: Convert into list of Crawls
                    
                }
                else {
                    completionBlock(error: response.result.error, list: Array<Crawl>());
                }
        }
    }
    
    func GetCrawl(crawlId: String, completionBlock: CrawlClosure) {
        Alamofire.request(.GET, URLStringWithExtension("Crawl"), parameters: ["crawlId": crawlId])
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
