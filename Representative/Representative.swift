//
//  Representative.swift
//  Representative
//
//  Created by Joseph Hansen on 7/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit
class Representative {
    
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
    
    init(name: String, party: String, state: String, district: String, phone: String, office: String,  link: String) {
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
        
        
        
    }
    init?(JSONdictionary: [String: AnyObject]) {
        guard let name = JSONdictionary[kName] as? String,
        let party = JSONdictionary[kParty] as? String,
        let state = JSONdictionary[kState] as? String,
        let district = JSONdictionary[kDistrict] as? String,
        let phone = JSONdictionary[kPhone] as? String,
        let office = JSONdictionary[kOffice] as? String,
        let link = JSONdictionary[kLink] as? String else { return nil }
        
        self.name = name
        self.party = party
        self.state = state
        self.district = district
        self.phone = phone
        self.office = office
        self.link = link
        
    }
    
}