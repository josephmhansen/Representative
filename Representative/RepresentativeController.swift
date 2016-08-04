//
//  RepresentativeController.swift
//  Representative
//
//  Created by Joseph Hansen on 8/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class RepresentativeController {
    private let kResults = "results"
    
    
    
    static let baseURL = NSURL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php?")
    
    static func searchRepsByState(search: String, completion: (representative: [Representative]) -> Void) {
        
        let urlParameters = ["state" : search, "output" : "json"]
        
        guard let url = RepresentativeController.baseURL else {
            print("error: no url found")
            completion(representative: [])
            return
        }
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            
            guard let data = data,
                let responseDataString = NSString(data: data, encoding: NSUTF8StringEncoding) as? String else {
                    print("error: no data Found")
                    completion(representative: [])
                    return
            }
            
            guard let jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject],
            let representativeDictionaries = jsonDictionary["results"] as? [[String: AnyObject]] else {
                print("error: issue serializing JSON \(responseDataString)")
                completion(representative: [])
                return
            }
            let representatives = representativeDictionaries.flatMap{Representative(jsonDictionary: $0)}
            
            completion(representative: representatives)
            
        }
    }
}
