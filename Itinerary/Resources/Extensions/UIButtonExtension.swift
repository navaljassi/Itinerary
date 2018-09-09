//
//  UIButtonExtension.swift
//  Itinerary
//
//  Created by Naval Jassi on 8/9/18.
//  Copyright © 2018 Naval Jassi. All rights reserved.
//

import UIKit

extension UIButton {
    func createFloatingActionButton () {
        backgroundColor = Theme.tint
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 10)
    }

    

}
