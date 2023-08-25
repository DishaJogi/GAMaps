//
//  CurrentLocationVC.swift
//  GAMaps
//
//  Created by admin on 13/07/23.
//

import UIKit
import MapKit
import CoreLocation

class CurrentLocationVC: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet weak var lbl_currentLocation: UILabel!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        // Do any additional setup after loading the view.
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        lbl_currentLocation.text = "locations = \(locValue.latitude) \(locValue.longitude)"
    }
}
