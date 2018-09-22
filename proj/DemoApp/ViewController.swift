//
//  ViewController.swift
//  DemoApp
//
//  Created by rakshitha on 19/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import CoreLocation
import GooglePlacePicker


class ViewController: UIViewController{
 
  
    @IBOutlet var myView: UIView!
    var mapView :GMSMapView?
    
    var locationManager = CLLocationManager()
    var camera = GMSCameraPosition()
    var currentLatitude:Double?
    var currentLongitude:Double?
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            mapInit()
            locationManagerInit()
            searchBarInit()
     
      
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    func mapInit()
    {
        mapView = GMSMapView()
        mapView?.frame = UIScreen.main.bounds
        self.mapView?.delegate = self
        self.myView.addSubview(mapView!)
    }
    func locationManagerInit()
    {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func searchBarInit()
    {
        resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self
        
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController
        
        searchController?.searchBar.placeholder = "Enter Location"
       
        
        searchController?.searchBar.sizeToFit()
        searchController?.searchBar.barTintColor = UIColor.clear
        searchController?.searchBar.backgroundImage = UIImage()
        
        navigationItem.titleView = searchController?.searchBar
        
        
        definesPresentationContext = true
        
        // Prevent the navigation bar from being hidden when searching.
        searchController?.hidesNavigationBarDuringPresentation = false
    }
    
   

    func setMarker(placeArray:[location])
    {
      
            for loc in placeArray
          {
              let marker = GMSMarker()
             marker.position = CLLocationCoordinate2D(latitude: loc.lat , longitude: loc.lng)
              print(marker.position)
              marker.title = loc.name
              marker.snippet = loc.vicinity
              location.obj.getImageFromWeb(url:loc.icon) { image in
                  marker.icon = image?.resized(newSize:CGSize(width:40,height:40))
                  }
             marker.map = mapView
           }
    }
   
    func getCurrentLocation()
    {
        currentLatitude = locationManager.location?.coordinate.latitude
        currentLongitude = locationManager.location?.coordinate.longitude
        camera = GMSCameraPosition.camera(withLatitude: currentLatitude!, longitude: currentLongitude!, zoom: 15)
        mapView?.camera = camera
        mapView?.settings.myLocationButton = true
        mapView?.isMyLocationEnabled = true
        
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: currentLatitude! , longitude: currentLongitude!)
        location.obj.getAddress(latitudes:currentLatitude!,longitudes:currentLongitude!) { (address) in
            print(address)
            marker.title = address["locality"] as? String
            marker.snippet = ((address["sublocality"] as? String)! + " " + (address["country"] as? String)!)
            
        }
        
        // marker.appearAnimation =
        marker.map = mapView
       
    }
    
    
}






extension ViewController:GMSMapViewDelegate{
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("tapped at ", coordinate.latitude)
    }
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print(marker.position)
    }
    
}

// Handle the user's selection.
extension ViewController: GMSAutocompleteResultsViewControllerDelegate {
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didAutocompleteWith place: GMSPlace) {
        searchController?.isActive = false
        camera = GMSCameraPosition.camera(withLatitude: place.coordinate.latitude, longitude:place.coordinate.longitude, zoom: 15)
        mapView?.camera = camera
        let  marker  = GMSMarker()
        
        marker.position = CLLocationCoordinate2D(latitude: place.coordinate.latitude , longitude: place.coordinate.longitude)
        print(marker.position)
        marker.title = place.name
        marker.snippet = place.formattedAddress
      
        marker.map = mapView
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,
                           didFailAutocompleteWithError error: Error){
        // TODO: handle the error.
        print("Error: ", error.localizedDescription)
    }
    
    // Turn the network activity indicator on and off again.
    func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}

extension UIImage {
    
    func resized(newSize:CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.main.scale)
        self.draw(in: CGRect(x:0, y:0, width:newSize.width, height:newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}

extension ViewController:CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        getCurrentLocation()
        locationManager.stopUpdatingLocation()
        location.obj.getNearbyplace(latitude: currentLatitude!, longitude: currentLongitude!) { (location) in
            self.setMarker(placeArray:location)
        }
        
    }
}
