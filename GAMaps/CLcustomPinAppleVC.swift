//
//  CLcustomPinAppleVC.swift
//  GAMaps
//
//  Created by admin on 14/07/23.
//

import UIKit
import MapKit
import CoreLocation

class CLcustomPinAppleVC: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{
    
    @IBOutlet weak var map_view: MKMapView!
    
    let newPin = MKPointAnnotation()
    private var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        map_view.delegate = self
         map_view.showsUserLocation = true
         locationManager = CLLocationManager()
         locationManager.delegate = self
         locationManager.desiredAccuracy = kCLLocationAccuracyBest

         // Check for Location Services
         if CLLocationManager.locationServicesEnabled() {
             locationManager.requestWhenInUseAuthorization()
             locationManager.startUpdatingLocation()
         }
        // Do any additional setup after loading the view.
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        map_view.removeAnnotation(newPin)

        let location = locations.last! as CLLocation

        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

        //set region on the map
        map_view.setRegion(region, animated: true)

        newPin.coordinate = location.coordinate
        map_view.addAnnotation(newPin)

    }
}
