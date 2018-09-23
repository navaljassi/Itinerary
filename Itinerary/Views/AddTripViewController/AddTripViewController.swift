//
//  AddTripViewController.swift
//  Itinerary
//
//  Created by Naval Jassi on 9/9/18.
//  Copyright © 2018 Naval Jassi. All rights reserved.
//

import Photos
import UIKit

class AddTripViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tripTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var doneSaving: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.layer.cornerRadius = 10
        
        // Dropshadow on title
        titleLabel.layer.shadowOpacity = 1
        titleLabel.layer.shadowColor = UIColor.white.cgColor
        titleLabel.layer.shadowOffset = CGSize.zero
        titleLabel.layer.shadowRadius = 5
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: Any) {
//        tripTextField.rightViewMode = .never
        
        guard tripTextField.text != "" else {
            
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
        TripFunctions.createTrip(tripModel: TripModel(title: tripTextField.text!, image: imageView.image))
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
    
    fileprivate func presentPhotoPickerController() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = .photoLibrary
        self.present(myPickerController, animated: true)
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            PHPhotoLibrary.requestAuthorization{ (status) in
                switch status {
                case .authorized:
                    self.presentPhotoPickerController()
                case .notDetermined:
                    if status == PHAuthorizationStatus.authorized{
                        self.presentPhotoPickerController()
                    }
                case .restricted:
                    let alert = UIAlertController(title: "Photo Library Access Restricted", message: "Photo library access is restriced and can not be accessed.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(okAction)
                    self.present(alert, animated: true)
                case .denied:
                    let alert = UIAlertController(title: "Photo Library Access Was Denied", message: "Photo library access was denied previously. Please updated your setting if you wish to.", preferredStyle: .alert)
                    let goToSettingsAction = UIAlertAction(title: "Go To Settings", style: .default) { (action) in
                    DispatchQueue.main.async {
                        let url = URL(string: UIApplicationOpenSettingsURLString)!
                        UIApplication.shared.open(url, options: [ : ])
                        }
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                    
                    alert.addAction(goToSettingsAction)
                    alert.addAction(cancelAction)
                    self.present(alert, animated: true)
                }
            }
        }
        
    }
    
}

extension AddTripViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.image = image

        }
        dismiss(animated: true)

    }
}




















