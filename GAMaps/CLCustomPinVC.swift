//
//  CLCustomPinVC.swift
//  GAMaps
//
//  Created by admin on 13/07/23.
//

import UIKit
import MapKit
import CoreLocation
import GoogleMaps
import GoogleMapsUtils

class CLCustomPinVC: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet weak var mapView: GMSMapView!
    
    let locationManager = CLLocationManager()
    let marker = GMSMarker()

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
        mapView.camera = camera
        markerView(position: camera.target)
    }
    func markerView(position: CLLocationCoordinate2D){

          let markerImage = UIImage(named: "img_pinsd")!.withRenderingMode(.alwaysTemplate)

          let markerView = UIImageView(image: markerImage)


          markerView.tintColor = UIColor.blue

          marker.position = position

          marker.iconView = markerView
          marker.map = mapView
         
          mapView.selectedMarker = marker
      }
}

