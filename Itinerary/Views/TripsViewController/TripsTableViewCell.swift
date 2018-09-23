//
//  TripsTableViewCell.swift
//  Itinerary
//
//  Created by Naval Jassi on 7/9/18.
//  Copyright © 2018 Naval Jassi. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        cardView.addShadowAndRoundedCourners()
        tripImageView.layer.cornerRadius = cardView.layer.cornerRadius
    }
    
    func setup (tripModel: TripModel){
        titleLabel.text = tripModel.title
        tripImageView.image = tripModel.image
    }

    

}
