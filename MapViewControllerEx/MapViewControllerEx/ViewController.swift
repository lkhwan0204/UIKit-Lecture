//
//  ViewController.swift
//  MapViewControllerEx
//
//  Created by kyuhyeon Lee on 3/4/25.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var lblLocationInfo1: UILabel!
    @IBOutlet weak var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        myMap.showsUserLocation = true
    }
    
    func goLocation(latitudeValue: CLLocationDegrees, longtitudeValue : CLLocationDegrees, delta span :Double) {
        let pLocation = CLLocationCoordinate2D(latitude: latitudeValue, longitude: longtitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: spanValue)
        myMap.setRegion(pRegion, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:  [CLLocation]) {
        let pLocation = locations.last
        goLocation(latitudeValue: (pLocation?.coordinate.latitude)!, longtitudeValue: pLocation?.coordinate.longtitude!, delta: 0.01)
        CLGeocoder().everseGeocodeLocation (pLocation!, completionHandler: {
            
    })
    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
    }
    
}

