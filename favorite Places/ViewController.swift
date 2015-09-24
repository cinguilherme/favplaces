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
        
        if selectedPlace != -1 {

            var lats:NSString = NSString(string: favoritePlaces[selectedPlace]["lat"]!)
            var lons:NSString = NSString(string: favoritePlaces[selectedPlace]["lon"]!)
            
            var latitude:CLLocationDegrees = lats.doubleValue
            var longitude:CLLocationDegrees = lons.doubleValue
        
            var span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
            var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
            var region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
            map.setRegion(region, animated: true)
        }
        
        var longPress:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: "action:")
        longPress.minimumPressDuration = 2
        
        map.addGestureRecognizer(longPress)
        
        if favoritePlaces.count > 0 {
            updateFavoritePlacesWithAPin()
        }
    }
    
    func updateFavoritePlacesWithAPin() {
        
        for place in favoritePlaces {
            
            var point:MKPointAnnotation = MKPointAnnotation()
            var name = place["name"]
            point.title = "\(name)"
        
            var lats:NSString = NSString(string: place["lat"]!)
            var lons:NSString = NSString(string: place["lon"]!)
            
            var latitude:CLLocationDegrees = lats.doubleValue
            var longitude:CLLocationDegrees = lons.doubleValue
        
            point.coordinate.latitude = latitude
            point.coordinate.longitude = longitude
            
            map.addAnnotation(point)
        }
    }
    
    func action(gesture:UILongPressGestureRecognizer) {
        println("longpress detected")
        
        var point:MKPointAnnotation = MKPointAnnotation()
        
        var pointv = gesture.locationInView(self.map)
        var location:CLLocationCoordinate2D = map.convertPoint(pointv, toCoordinateFromView: self.map)
        println(location)
        point.coordinate = location
        var locl:CLLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)

        CLGeocoder().reverseGeocodeLocation(locl) { (placemarks, error) -> Void in
            if error == nil {
                if placemarks.count > 0 {
                    if placemarks[0].thoroughfare != nil {
                        point.title = placemarks[0].thoroughfare
                    } else {
                        point.title = "Added \(NSDate().description)"
                    }
                    if placemarks[0].subThoroughfare != nil {
                        point.subtitle = placemarks[0].subThoroughfare
                    }
                    self.map.addAnnotation(point)
                    favoritePlaces.append(["name":"\(point.title)","lat":"\(location.latitude)" ,"lon":"\(location.longitude)"])
                    
                    NSUserDefaults.standardUserDefaults().setObject(favoritePlaces, forKey: "places")

                } else {
                    point.title = NSDate().description
                }
            } else {
                point.title = NSDate().description
            }
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

