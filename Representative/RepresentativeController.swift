//
//  RepresentativeController.swift
//  Representative
//
//  Created by Joseph Hansen on 7/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class RepresentativeController {
    
    static let baseURL = "http://whoismyrepresentative.com/getall_reps_bystate.php"
    
    static func searchRepsByState(state: String, completion: (representatives: [Representative]) -> Void) {
        guard let url = NSURL(string: baseURL) else {
            completion(representatives: [])
            return
        }
        
        let urlParameters = ["state": "\(state)", "output": "json"]
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters) { (data, error) in
            
            guard let data = data,
            let json = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String: AnyObject],
                let representativeDictionaries = json["results"] as? [[String:AnyObject]] else {
                    
                    print("unable to serialize json")
                    completion(representatives: [])
                    return
            }
            let representatives = representativeDictionaries.flatMap ({Representative(JSONdictionary: $0)})
            
            completion (representatives: representatives)
        } 
    
    
        
    
    }
    

}

