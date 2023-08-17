//
//  MapViewController.swift
//  RideSharer
//
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if CLLocationManager.locationServicesEnabled() {
            checkLocationAuthorization()
        } else {
            let alert = UIAlertController(title: "Authorization Denied",
                                          message: "Please turn on location permission",
                                          preferredStyle: .alert)
            let okAlert = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAlert)
            
            self.present(alert, animated: true)
        }
    }
    
    func checkLocationAuthorization() {
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
        case .denied:
            let alert = UIAlertController(title: "Authorization Denied",
                                          message: "Please turn on location permission",
                                          preferredStyle: .alert)
            let okAlert = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAlert)
            
            present(alert, animated: true)
        case .notDetermined:
            let alert = UIAlertController(title: "Authorization Denied",
                                          message: "Please turn on location permission",
                                          preferredStyle: .alert)
            let okAlert = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAlert)
            
            present(alert, animated: true){
                self.locationManager.requestWhenInUseAuthorization()
            }
        case .restricted: // Show an alert letting them know what’s up
            let alert = UIAlertController(title: "Authorization Denied",
                                          message: "Please turn on location permission",
                                          preferredStyle: .alert)
            let okAlert = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAlert)
            
            present(alert, animated: true)
        case .authorizedAlways:
            break
        }
    }
}
