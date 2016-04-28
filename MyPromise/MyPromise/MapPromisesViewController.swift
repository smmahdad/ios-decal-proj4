//
//  MapPromisesViewController.swift
//  MyPromise
//
//  Created by Sam Mahdad on 4/27/16.
//  Copyright © 2016 Sam Mahdad. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapPromisesViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var geoProm : [GeoPromise]?
    var locValue : CLLocationCoordinate2D?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.locationManager.distanceFilter = 100.0
        mapView.showsUserLocation = true
//        locValue = locationManager.location!.coordinate
//        let address = "1 Infinite Loop, CA, USA"
        
        
        cycleThroughAndPin()
        
    }
    
    func cycleThroughAndPin() {
        
//        let geocoder = CLGeocoder()
        for elem in geoProm! {
            mapView.addAnnotation(elem)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse || status == .NotDetermined {
            // authorized location status when app is in use; update current location
            locationManager.startUpdatingLocation()
//            locValue = manager.location!.coordinate
            // implement additional logic if needed...
        }
        // implement logic for other status values if needed...
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locValue = manager.location!.coordinate
        let regionRadius: CLLocationDistance = 1000
        centerMapOnLocation(manager.location!, regionRadius: regionRadius)
        print("locations = \(locValue!.latitude) \(locValue!.longitude)")
    }
    
    
    
    func displayLocationInfo(placemark: CLPlacemark) {
        
        self.locationManager.stopUpdatingLocation()
        print(placemark.locality)
        print(placemark.postalCode)
        print(placemark.administrativeArea)
        print(placemark.country)
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error: " + error.localizedDescription)
    }
    func centerMapOnLocation(location: CLLocation, regionRadius: CLLocationDistance) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }

}
