//
//  LocationService.swift
//  MyWeatherApp
//
//  Created by Christophe Foucan on 12/03/2017.
//  Copyright © 2017 Christophe Foucan. All rights reserved.
//

import CoreLocation

class LocationService: NSObject {
    static var shared = LocationService()
    
    var locationManager : CLLocationManager = CLLocationManager()
    var locationFixAchieved : Bool = false
    
    func requestLocation(completion: (Bool, CLLocationCoordinate2D) -> Void) {
        initLocationManager()

        if let locationObject = locationManager.location {
            //print(locationObject.coordinate.latitude)
            completion(true,locationObject.coordinate)
        }
        else {
            completion(false,kCLLocationCoordinate2DInvalid)
        }
    }
}

// MARK: - CLLocationManagerDelegate
extension LocationService : CLLocationManagerDelegate {
    
    //Location Events
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
            let pm = placemarks![0]
            self.displayLocationInfo(placemark: pm)
        })
        
        if (locationFixAchieved == false) {
            locationFixAchieved = true
            let locationArray = locations as NSArray
            _ = locationArray.lastObject as! CLLocation
        }
        
    }
    
    //Tells the delegate that new location data is available.
    func locationManager(_: CLLocationManager, didFailWithError: Error) {
        
    }
    //Tells the delegate that the location manager was unable to retrieve a location value.
    func locationManager(_: CLLocationManager, didFinishDeferredUpdatesWithError: Error?) {
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error finding location: \(error.localizedDescription)")
    }
    
    func refresh() {
        initLocationManager()
    }
    
    func initLocationManager() {
        locationFixAchieved = false
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
    }
    
    func displayLocationInfo(placemark: CLPlacemark?) {
        if placemark != nil {
            //stop updating location to save battery life
            self.locationManager.stopUpdatingLocation()
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        var shouldIAllow = false
        
        switch status {
        case CLAuthorizationStatus.restricted: break
            
        case CLAuthorizationStatus.denied: break
            
        case CLAuthorizationStatus.notDetermined: break
            
        default:
            shouldIAllow = true
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "LabelHasbeenUpdated"), object: nil)
        if (shouldIAllow == true) {
            NSLog("Location to Allowed")
            // Start location services
            self.locationManager.startUpdatingLocation()
        } else {
            NSLog("Denied access:")
        }
    }
}
