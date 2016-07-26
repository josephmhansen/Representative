//
//  RepresentativeController.swift
//  Representative
//
//  Created by Joseph Hansen on 7/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class RepresentativeController {
    init() {
        RepresentativeController.searchRepsByState("NV") { (representatives) in
 
        }
    }
    
    
    
    static let baseURL = "http://whoismyrepresentative.com/getall_reps_bystate.php"
    
    static func searchRepsByState(state: String, completion: (representatives: [Representative])-> Void) {
        guard let url = NSURL(string: baseURL) else {
            completion(representatives: [])
            return
        }
        let urlParameters = ["state": "\(state)", "output": "json"]
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            guard let data = data,
                responseDataString = NSString(data: data, encoding: NSUTF8StringEncoding) else {
                    print("No data returned from Network")
                    completion(representatives: [])
                    return
            }
                 guard let jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject],
                let representativeDictionaries = jsonDictionary["results"] as? [[String: AnyObject]] else {
                    
                    print("unable to serialize json /n Response\(responseDataString)")
                    completion(representatives: [])
                    return
                    
            
            }
            let representatives = representativeDictionaries.flatMap {Representative(jsonDictionary: $0) }
            completion (representatives: representatives)
             print("Successful Network Request /n\(representatives)" )
        }
    }
}
