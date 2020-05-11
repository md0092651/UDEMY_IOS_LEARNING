//
//  ViewController.swift
//  Module7-AceWeather
//
//  Created by Monika Singh on 07/05/20.
//  Copyright © 2020 com.phomotech. All rights reserved.
//

import UIKit
import Gifu
import CoreLocation

class ViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate let viewModel = WeatherViewModel()
    
    var locationManager : CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        
        tableView?.dataSource = viewModel
        tableView?.delegate = viewModel
        tableView?.estimatedRowHeight = 500
        tableView?.rowHeight = UITableView.automaticDimension
        tableView?.register(HeaderCell.nib, forCellReuseIdentifier: HeaderCell.identifier)
        tableView?.register(DetailCell.nib, forCellReuseIdentifier: DetailCell.identifier)
        tableView?.register(DetailsCollectionTableViewCell.nib, forCellReuseIdentifier: DetailsCollectionTableViewCell.identifier)
        tableView?.register(HourlyForecastChartViewCell.nib, forCellReuseIdentifier: HourlyForecastChartViewCell.identifier)
        tableView?.register(WeeklyForecastTableViewCell.nib, forCellReuseIdentifier: WeeklyForecastTableViewCell.identifier)

    }
    
    
    
    
}

extension ViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.last ?? 0)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
