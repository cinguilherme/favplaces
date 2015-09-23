//
//  ViewController.swift
//  favorite Places
//
//  Created by Gulherme Cintra on 23/09/15.
//  Copyright (c) 2015 Gulherme Cintra. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        println(selectedPlace)
        
        var latitude:CLLocationDegrees = selectedPlace.latitude
        var longitude:CLLocationDegrees = selectedPlace.longitude
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

