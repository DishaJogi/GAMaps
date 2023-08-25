//
//  PolyLineTwoLetLong.swift
//  GAMaps
//
//  Created by admin on 13/07/23.
//

import UIKit
import GoogleMaps
import GooglePlaces
import Alamofire
import SwiftyJSON

class PolyLineTwoLetLong: UIViewController {
    
    @IBOutlet weak var maps_view: GMSMapView!
    
    let coordinates = [
        CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), // Example coordinate 1
        CLLocationCoordinate2D(latitude: 37.3352, longitude: -122.0322), // Example coordinate 2
        // Add more coordinates as needed
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = GMSMutablePath()
        for coordinate in coordinates {
            path.add(coordinate)
        }

        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 3
        polyline.strokeColor = .blue
        polyline.map = maps_view
    }
    func requestDirections(from origin: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {
        let originString = "\(origin.latitude),\(origin.longitude)"
        let destinationString = "\(destination.latitude),\(destination.longitude)"
        let apiKey = "YOUR_GOOGLE_DIRECTIONS_API_KEY"
        
        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(originString)&destination=\(destinationString)&key=\(apiKey)"
        
//        Alamofire.request(url).responseJSON { response in
//            if response.result.isSuccess {
//                let json = JSON(response.result.value!)
//                if let routes = json["routes"].array, let route = routes.first {
//                    if let polyline = route["overview_polyline"]["points"].string {
//                        self.drawPolyline(encodedPolyline: polyline)
//                    }
//                }
//            } else {
//                print("Error: \(response.result.error)")
//            }
//        }
    }
    func drawPolyline(encodedPolyline: String) {
        let path = GMSPath(fromEncodedPath: encodedPolyline)
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 3
        polyline.strokeColor = .blue
//        polyline.map = mapView
    }
}
