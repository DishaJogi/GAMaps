//
//  AppleCurrentLocVC.swift
//  GAMaps
//
//  Created by admin on 14/07/23.
//

import UIKit
import MapKit
import CoreLocation

class AppleCurrentLocVC: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var lbl_currentLocation: UILabel!
    
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        if (CLLocationManager.locationServicesEnabled())
              {
                  locationManager = CLLocationManager()
                  locationManager.delegate = self
                  locationManager.desiredAccuracy = kCLLocationAccuracyBest
                  locationManager.requestAlwaysAuthorization()
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
