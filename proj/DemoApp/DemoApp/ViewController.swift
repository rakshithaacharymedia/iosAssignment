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
import CoreData

class ViewController : UIViewController{
  
 
  
    @IBOutlet var myView : UIView!
    var mapView : GMSMapView?
    var customView : CustomUIView?
    var locationManager = CLLocationManager()
    var camera = GMSCameraPosition()
    var currentLatitude:Double?
    var currentLongitude:Double?
    var destinationObj : CustomObject?
    var sourceObj : CustomObject?
    
    var resultsViewController : GMSAutocompleteResultsViewController?
    var searchController : UISearchController?
  
    
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
        searchController?.searchBar.barTintColor = UIColor.red
        searchController?.searchBar.backgroundImage = UIImage()
        
        navigationItem.titleView = searchController?.searchBar
        
        
        definesPresentationContext = true
        
        // Prevent the navigation bar from being hidden when searching.
        searchController?.hidesNavigationBarDuringPresentation = false
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
        GooglePlacesApi.obj.getAddress(latitudes:currentLatitude!,longitudes:currentLongitude!) { (address) in
            marker.title = address["locality"] as? String
            marker.snippet = ((address["sublocality"] as? String)! + " " + (address["country"] as? String)!)
            self.sourceObj = CustomObject(name: address["sublocality"] as! String, latitude:self.currentLatitude!, longitude: self.currentLongitude!)
            
        }
       marker.map = mapView
     }
}


extension ViewController : GMSMapViewDelegate{
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
        GooglePlacesApi.obj.getAddress(latitudes: coordinate.latitude, longitudes: coordinate.longitude) { (address) in
            self.displayView(placeName: (address["sublocality"] as! String), placeAddress: address["locality"] as! String,destinationLatitude:coordinate.latitude,destinationLongitude:coordinate.longitude)
        
     }
    }
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
      
        displayView(placeName: marker.title!, placeAddress: marker.snippet!,destinationLatitude: marker.position.latitude,destinationLongitude:marker.position.longitude)
        return true
    }
    func displayView(placeName : String,placeAddress:String,destinationLatitude:Double,destinationLongitude:Double)
    {
        self.customView = CustomUIView()
        self.customView?.frame = CGRect(x: 0 , y: (mapView?.bounds.size.height)! - 200, width:(UIScreen.main.bounds.width), height: 155)
        self.customView?.nameLabel.text = placeName
        self.customView?.placeLabel.text = placeAddress
        self.customView?.directionButton.addTarget(self, action:#selector(ViewController.directionButtonClicked) , for: .touchUpInside)
         destinationObj = CustomObject(name: placeAddress, latitude: destinationLatitude, longitude: destinationLongitude)
        self.mapView?.addSubview(self.customView!)
    }
    
    
   @objc func directionButtonClicked(sender:UIButton)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DisplayPathViewController") as? DisplayPathViewController
        vc?.sourceObj = sourceObj
        vc?.destinationObj = destinationObj
        navigationController?.pushViewController(vc!, animated: true)
    }

}

extension ViewController : GMSAutocompleteResultsViewControllerDelegate {
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController,didAutocompleteWith place: GMSPlace) {
        
        searchController?.isActive = false
        customView?.isHidden = true
        
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
      print("Error: ", error.localizedDescription)
    }
    
   
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

extension ViewController : CLLocationManagerDelegate
{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
     
        getCurrentLocation()
        locationManager.stopUpdatingLocation()
        
        //get nearby location and store in data base
        GooglePlacesApi.obj.getNearbyplace(latitude: currentLatitude!, longitude: currentLongitude!) { (placeArray) in
            
            for placeObj in placeArray
            {
                DataStore.obj.insert(place : placeObj)
            }
        }
       
            //get data from database and display
        
    let placeDetailArray =  DataStore.obj.fetch()
        for placeObj in placeDetailArray
        {
            let marker  = GMSMarker()
            marker.title  = placeObj.name
            marker.snippet = placeObj.vicinity
            marker.position  = CLLocationCoordinate2D(latitude: placeObj.latitude, longitude: placeObj.longitude)
            print(marker.position)
            GooglePlacesApi.obj.getImageFromWeb(url:placeObj.icon!) { image in
                marker.icon = image?.resized(newSize:CGSize(width:30,height:30))
            }
            marker.map = mapView
        }
        }
        
    }


