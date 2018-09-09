//
//  AppUIButton.swift
//  Itinerary
//
//  Created by Naval Jassi on 9/9/18.
//  Copyright © 2018 Naval Jassi. All rights reserved.
//

import UIKit

class AppUIButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = Theme.tint
        layer.cornerRadius = frame.height / 2
        setTitleColor(UIColor.white, for: .normal)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
