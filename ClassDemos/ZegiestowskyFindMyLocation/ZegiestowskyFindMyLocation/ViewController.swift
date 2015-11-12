//
//  ViewController.swift
//  ZegiestowskyFindMyLocation
//
//  Created by Ashley Zegiestowsky on 11/10/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    let locationManager = CLLocationManager()

    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func zoomIn(sender: AnyObject) {
        //set up th map's region to zoom in
        let spanX = 0.007
        let spanY = 0.007
        
        let newRegion = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpanMake(spanX, spanY))
        
        mapView.setRegion(newRegion, animated: true)
    }
    
    @IBAction func displayLocation(sender: AnyObject) {
        
        //set the class as delegate for locationManager
        locationManager.delegate = self
        
        //specify location accuracy
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        //display a prompt for authorization
        locationManager.requestWhenInUseAuthorization()
        
        //start receiving location updates from CoreLocation
        locationManager.startUpdatingLocation()
        
        //set up the map view
        mapView.delegate = self
        mapView.mapType = MKMapType.Standard
        mapView.showsUserLocation = true

    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //pass location coordinates and check for errors
        
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: { (placemarks, error) -> Void in
            
            if (error != nil) {
                print("Reverse geocoder failed with error: " + error!.localizedDescription)
                return
            }
            
            //pass the placemark details to displayLocation
            if placemarks!.count > 0 {
                let pm = placemarks![0] as CLPlacemark
                self.displayLocationDetails(pm)
            } else {
                print("Problem with the data received from geocoder")
            }
        
        })
    }
    
    func displayLocationDetails(placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            //stop updating location to save battery life
            locationManager.startUpdatingLocation()
            
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            locationDetails.text = "\(locality!) \n \(postalCode!) \n \(administrativeArea!) \n \(country!) \n latitude: \(containsPlacemark.location!.coordinate.latitude) \n longitude: \(containsPlacemark.location!.coordinate.longitude)"
            
        }
        
    }
    
    
    @IBOutlet weak var locationDetails: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

