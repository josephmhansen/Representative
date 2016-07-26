//
//  StateDetailTableViewCell.swift
//  Representative
//
//  Created by Joseph Hansen on 7/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class StateDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func updateWithRepresentative(representative: Representative) {
        nameLabel.text = representative.name
        partyLabel.text = "Party: \(representative.party)"
        districtLabel.text = "District: \(representative.district)"
        phoneLabel.text = "Phone: \(representative.phone)"
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
