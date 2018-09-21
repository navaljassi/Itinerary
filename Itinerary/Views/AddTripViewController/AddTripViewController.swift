//
//  AddTripViewController.swift
//  Itinerary
//
//  Created by Naval Jassi on 9/9/18.
//  Copyright © 2018 Naval Jassi. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var doneSaving: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: Any) {
//        tripTextField.rightViewMode = .never
        
        guard tripTextField.text != ""  else {
            
            //Alternative 1
//            let imageView =  UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
//            imageView.image =
//            imageView.contentMode = .scaleAspectFit
            
//            tripTextField.rightView = imageView
//            tripTextField.rightViewMode = .always
            
            //Alternative 2
//            tripTextField.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            
            //Alternative 3
            
            tripTextField.layer.borderColor = UIColor.red.cgColor
            tripTextField.layer.borderWidth = 1
            tripTextField.layer.cornerRadius = 5
            
            tripTextField.text = "Trip Name Required"
            tripTextField.textColor = .red

            
            return
        
        }
        TripFunctions.createTrip(tripModel: TripModel(title: tripTextField.text!))
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
}
