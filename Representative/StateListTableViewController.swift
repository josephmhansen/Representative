//
//  StateListTableViewController.swift
//  Representative
//
//  Created by Joseph Hansen on 8/4/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return StateController.states.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("stateCell", forIndexPath: indexPath)

        let state = StateController.states[indexPath.row]
        cell.textLabel?.text = state

        return cell
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        where am i going?
        if segue.identifier == "toDetail" {
            if let destinationVC = segue.destinationViewController as? RepresentativeDetailTableViewController,
                //        how am i getting there?
                let selectedIndex = tableView.indexPathForSelectedRow?.row {
                //        whate am i taking, where is it now
                let state = StateController.states[selectedIndex]
                //        did i bring it
                destinationVC.state = state
            }

        }
        


    }
 

}
