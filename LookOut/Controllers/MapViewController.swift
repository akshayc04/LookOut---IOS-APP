//
//  MapViewController.swift
//  LookOut
//
//  Created by Akshay on 4/20/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
  
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet private weak var mapCenterPinImage: UIImageView!
  @IBOutlet private weak var pinImageVerticalConstraint: NSLayoutConstraint!
    private let locationManager = CLLocationManager()
    private let dataProvider = GoogleDataProvider()
    private let searchRadius: Double = 1000
    
    
  var searchedTypes = ["bakery", "bar", "cafe", "grocery_or_supermarket", "restaurant"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    mapView.delegate = self
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let controller = segue.destination as? TypesTableViewController else {
        return
    }
    controller.selectedTypes = searchedTypes
    controller.delegate = self
  }
    
    private func fetchNearbyPlaces(coordinate: CLLocationCoordinate2D) {
        // 1
        mapView.clear()
        // 2
        dataProvider.fetchPlacesNearCoordinate(coordinate, radius:searchRadius, types: searchedTypes) { places in
            places.forEach {
                // 3
                let marker = PlaceMarker(place: $0)
                // 4
                marker.map = self.mapView
            }
        }
    }
    
}

// MARK: - TypesTableViewControllerDelegate
extension MapViewController: TypesTableViewControllerDelegate {
  func typesController(_ controller: TypesTableViewController, didSelectTypes types: [String]) {
    searchedTypes = controller.selectedTypes.sorted()
    
    navigationController?.popViewController(animated: true)
    fetchNearbyPlaces(coordinate: mapView.camera.target)
    //dismiss(animated: true, completion: nil)
  }
}

extension MapViewController: CLLocationManagerDelegate {
    // 2
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // 3
        guard status == .authorizedWhenInUse else {
            return
        }
        // 4
        locationManager.startUpdatingLocation()
        
        //5
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    // 6
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        // 7
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        
        // 8
        locationManager.stopUpdatingLocation()
        fetchNearbyPlaces(coordinate: location.coordinate)
    }
}
extension MapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, markerInfoContents marker: GMSMarker) -> UIView? {
        // 1
        guard let placeMarker = marker as? PlaceMarker else {
            return nil
        }
        
        // 2
        guard let infoView = UIView.viewFromNibName("MarkerInfoView") as? MarkerInfoView else {
            return nil
        }
        
        // 3
        infoView.nameLabel.text = placeMarker.place.name
        
        // 4
        if let photo = placeMarker.place.photo {
            infoView.placePhoto.image = photo
        } else {
            infoView.placePhoto.image = UIImage(named: "generic")
        }
        
        return infoView
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        mapCenterPinImage.fadeOut(0.25)
        return false
    }
    
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        if (gesture) {
            mapCenterPinImage.fadeIn(0.25)
            mapView.selectedMarker = nil
        }
        
        func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
            mapCenterPinImage.fadeIn(0.25)
            mapView.selectedMarker = nil
            return false
        }
    }
}
