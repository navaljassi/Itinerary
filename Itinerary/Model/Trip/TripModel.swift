//
//  TripModel.swift
//  Itinerary
//
//  Created by Naval Jassi on 3/9/18.
//  Copyright © 2018 Naval Jassi. All rights reserved.
//

import Foundation

class TripModel {
    var id: String!
    var title: String!
    
    init(title: String) {
        id = UUID().uuidString
        self.title = title
    }
}
