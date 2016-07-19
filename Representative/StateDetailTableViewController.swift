//
//  StateDetailTableViewController.swift
//  Representative
//
//  Created by Joseph Hansen on 7/18/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class StateDetailTableViewController: UITableViewController {
    
    var state: String?
    var representatives: [Representative] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let state = state {
            UIApplication.sharedApplication().networkActivityIndicatorVisible = true
            
            RepresentativeController.searchRepsByState(state, completion: { (representatives) in
                self.representatives = representatives
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                })
            })
        }
        
        
    }
    
    

    // MARK: - Table view data source

 

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return representatives.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("representativeCell", forIndexPath: indexPath) as? RepresentativeTableViewCell ?? RepresentativeTableViewCell()
        let representative = representatives[indexPath.row]
        cell.updateWithRepresentatives(representative)

        // Configure the cell...

        return cell
    }
 

    
}
