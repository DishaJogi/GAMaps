//
//  searchAppleVC.swift
//  GAMaps
//
//  Created by admin on 14/07/23.
//

import UIKit
import MapKit

class searchAppleVC: UIViewController, MKMapViewDelegate, UISearchBarDelegate{
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        searchBar.delegate = self
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }
    
    
    @IBAction func onclicksearchAction(_ sender: UIButton) {
        // Get the search query from the search bar text
         let searchQuery = searchBar.text ?? ""
         
         // Create a search request
         let searchRequest = MKLocalSearch.Request()
         searchRequest.naturalLanguageQuery = searchQuery
         
         // Perform the search
         let search = MKLocalSearch(request: searchRequest)
         search.start { (response, error) in
             if let mapItems = response?.mapItems {
                 // Process the search results (e.g., display annotations on the map)
                 for item in mapItems {
                     self.addAnnotationForMapItem(item)
                 }
             }
         }
    }
    func addAnnotationForMapItem(_ mapItem: MKMapItem) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = mapItem.placemark.coordinate
        annotation.title = mapItem.name
        annotation.subtitle = mapItem.placemark.title
        mapView.addAnnotation(annotation)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let completer = MKLocalSearchCompleter()
            completer.queryFragment = searchText
            completer.region = mapView.region
            
//            completer.results { (results, error) in
//                if let error = error {
//                    print("Search error: \(error.localizedDescription)")
//                } else {
//                    // Process the completion results
//                    let suggestions = results.map { $0.title }
//                    // Display or update the suggestions in a table view or other UI component
//                    // ...
//                }
//            }
    }
    
}
