//
//  TripFunction.swift
//  Itinerary
//
//  Created by Naval Jassi on 3/9/18.
//  Copyright © 2018 Naval Jassi. All rights reserved.
//

import Foundation

class TripFunctions {
    
    static func createTrip (tripModel: TripModel){
        Data.tripModel.append(tripModel)
    }
    
    static func readTrips(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModel.count == 0 {
                Data.tripModel.append(TripModel(title: "Trip To Bali"))
                Data.tripModel.append(TripModel(title: "Trip To Maxico"))
                Data.tripModel.append(TripModel(title: "Trip To Thailand"))
            }
            DispatchQueue.main.async {
                completion()
            }
        }
    }
    
    static func updateTrip (tripModel: TripModel){
        
    }
    
    static func deleteTrip (tripModel: TripModel){
        
    }
}
