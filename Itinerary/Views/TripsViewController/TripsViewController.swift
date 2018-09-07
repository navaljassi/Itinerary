//
//  TripsViewController.swift
//  Itinerary
//
//  Created by Naval Jassi on 7/9/18.
//  Copyright © 2018 Naval Jassi. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        TripFunctions.readTrips(completion: {[weak self] in
            self?.tableView.reloadData()
        })

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = Data.tripModel[indexPath.row].title
        return cell!
    }



}
