//
//  ViewController.swift
//  ZegiestowskyFindMyLocation
//
//  Created by Ashley Zegiestowsky on 11/10/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()

    @IBAction func displayLocation(sender: AnyObject) {
        
        //set the class as delegate for locationManager
        locationManager.delegate = self
        
        //specify location accuracy
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        //display a prompt for authorization
        locationManager.requestWhenInUseAuthorization()
        
        //start receiving location updates from CoreLocation
        locationManager.startUpdatingLocation()
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

