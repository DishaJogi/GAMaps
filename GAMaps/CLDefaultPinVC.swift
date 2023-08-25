//
//  CLDefaultPinVC.swift
//  GAMaps
//
//  Created by admin on 13/07/23.
//

import UIKit
import MapKit
import CoreLocation
import GoogleMaps

class CLDefaultPinVC: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet weak var view_GM: GMSMapView!
    
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
        let camera = GMSCameraPosition.camera(withLatitude: locValue.latitude, longitude: locValue.longitude, zoom: 6.0)
        view_GM.camera = camera
        showMarker(position: camera.target)
    }
    func showMarker(position: CLLocationCoordinate2D){
        let marker = GMSMarker()
        marker.position = position
        marker.map = view_GM
    }
}
