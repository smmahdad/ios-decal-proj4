//
//  GeoPromise.swift
//  MyPromise
//
//  Created by Sam Mahdad on 4/27/16.
//  Copyright © 2016 Sam Mahdad. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class GeoPromise : Promise, MKAnnotation {
    var coordinates: CLLocationCoordinate2D?
    var geoName : String?
    var subtitle: String?
    
    
    init(titleInput: String?, descriptionInput: String?, geoName: String?) {
        super.init(titleInput: titleInput, descriptionInput: descriptionInput)
        subtitle = descriptionInput
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(geoName!, completionHandler: {(placemarks, error) -> Void in
            if((error) != nil){
                print("Error", error)
            }
            if let placemark = placemarks?.first {
                let coordinate:CLLocationCoordinate2D = placemark.location!.coordinate
                self.coordinates = coordinate
                
                
            }
        })
        
        self.geoName = geoName
        
        
    }
    
//    func getCoordinates(locationName: String?, completionHandler: (lat: CLLocationDegrees!, long: CLLocationDegrees!) -> ()) -> Void {
//        
//        var lat:CLLocationDegrees?
//        var long:CLLocationDegrees?
//        
//        let geocoder = CLGeocoder()
//        
//        geocoder.geocodeAddressString(locationName!, completionHandler: {(placemarks: [CLPlacemark]?, error: NSError?) -> Void in
//            if placemarks!.count > 0 {
//                let placemark = placemarks![0] as CLPlacemark
//                lat = placemark.location!.coordinate.latitude
//                long = placemark.location!.coordinate.longitude
//            }
////            self.coordinates = CLLocationCoordinate2D(latitude: lat!, longitude: long!)
//        })
//        
//        completionHandler(lat: lat, long: long)
//        
//    }
    
    var coordinate: CLLocationCoordinate2D {
        return self.coordinates!
    }
    
    
}
