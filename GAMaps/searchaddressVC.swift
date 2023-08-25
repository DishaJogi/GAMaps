//
//  searchaddressVC.swift
//  GAMaps
//
//  Created by admin on 14/07/23.
//

import UIKit
import GoogleMaps
import GooglePlaces

class searchaddressVC: UIViewController, GMSAutocompleteViewControllerDelegate {
    
    @IBOutlet weak var mapView: GMSMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
    }
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        // Dismiss the autocomplete view controller
        viewController.dismiss(animated: true, completion: nil)

        // Get the selected place's coordinates
        let latitude = place.coordinate.latitude
        let longitude = place.coordinate.longitude

        // Create a new map camera position using the selected coordinates
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 15.0)

        // Update the map view with the new camera position
        mapView.camera = camera
    }

    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // Handle the error
        print("Error: \(error.localizedDescription)")
    }

    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        // Dismiss the autocomplete view controller
        viewController.dismiss(animated: true, completion: nil)
    }


}
