//
//  UIViewExtensions.swift
//  Itinerary
//
//  Created by Naval Jassi on 8/9/18.
//  Copyright © 2018 Naval Jassi. All rights reserved.
//

import UIKit

extension UIView {

    func addShadowAndRoundedCourners () {
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
    }

}
