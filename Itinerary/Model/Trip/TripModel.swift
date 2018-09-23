//
//  TripModel.swift
//  Itinerary
//
//  Created by Naval Jassi on 3/9/18.
//  Copyright © 2018 Naval Jassi. All rights reserved.
//

import UIKit

class TripModel {
    var id: UUID
    var title: String
    var image: UIImage?
    
    init(title: String, image: UIImage? = nil) {
        id = UUID()
        self.title = title
        self.image = image
    }
}
