//
//  Representative.swift
//  Representative
//
//  Created by Joseph Hansen on 8/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct Representative {
    
    private let kName = "name"
    private let kParty = "party"
    private let kState = "state"
    private let kDistrict = "district"
    private let kPhone = "phone"
    private let kOffice = "office"
    private let kLink = "link"
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: String
    
    init?(jsonDictionary: [String: AnyObject]){
        guard let name = jsonDictionary[kName] as? String,
            let party = jsonDictionary[kParty] as? String,
            let state = jsonDictionary[kState] as? String,
            let district = jsonDictionary[kDistrict] as? String,
            let phone = jsonDictionary[kPhone] as? String,
            let office = jsonDictionary[kOffice] as? String,
            let link = jsonDictionary[kLink] as? String else { return nil }
        
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
        
    }
}