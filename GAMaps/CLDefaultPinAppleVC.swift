//
//  CLDefaultPinAppleVC.swift
//  GAMaps
//
//  Created by admin on 14/07/23.
//

import UIKit
import MapKit
import CoreLocation

class CLDefaultPinAppleVC: UIViewController, CLLocationManagerDelegate,MKMapViewDelegate{

    @IBOutlet weak var mapView: MKMapView!
    
    private var locationManager: CLLocationManager!
    private var currentLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
         mapView.showsUserLocation = true
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
      defer { currentLocation = locations.last }

      if currentLocation == nil {
          // Zoom to user location
          if let userLocation = locations.last {
              let viewRegion = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
              mapView.setRegion(viewRegion, animated: false)
          }
      }
  }

}
