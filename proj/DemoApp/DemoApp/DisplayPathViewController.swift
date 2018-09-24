//
//  DisplayPathViewController.swift
//  DemoApp
//
//  Created by rakshitha on 24/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import MapKit
class DisplayPathViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sourcetextField: UITextField!
    @IBOutlet weak var map: MKMapView!
    var sourceObj : CustomObject?
    var destinationObj : CustomObject?
    var sourceLatitude : Double?
    var sourceLongitude : Double?
    var destinationLatitude : Double?
     var destinationLongitude : Double?
    var arrayAddress = [GMSAutocompletePrediction]()
    var filter : GMSAutocompleteFilter {
        let filter = GMSAutocompleteFilter()
        filter.type = .address
        return filter
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldInit()
        tableInit()
        cordinateInit()
        
        displayMap(destinationLatitude: destinationLatitude!,destinationLongitude: destinationLongitude!)
   
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldInit()
    {
        sourcetextField.text = sourceObj?.name
        destinationTextField.text = destinationObj?.name
        destinationTextField.delegate = self
        
    }
    
    func tableInit()
    {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
    }
    func cordinateInit()
    {
        sourceLatitude = sourceObj?.latitude
        sourceLongitude = sourceObj?.longitude
        destinationLatitude = destinationObj?.latitude
        destinationLongitude = destinationObj?.longitude
        map.delegate = self
        
    }
    
    func displayMap(destinationLatitude:Double,destinationLongitude:Double)
    {
        
        
        let sourceLocation = CLLocationCoordinate2D(latitude: sourceLatitude!, longitude: sourceLongitude!)
        let destinationLocation =  CLLocationCoordinate2D(latitude: destinationLatitude, longitude: destinationLongitude)
        print(destinationLocation.latitude)
        
//        let sourcePin = CustomPin(coordinate: sourceLocation, title: (sourceObj?.name)!)
//        let destinationPin  = CustomPin(coordinate: destinationLocation, title: (destinationObj?.name)!)
//
//        self.map.addAnnotation(sourcePin)
//        self.map.addAnnotation(destinationPin)
        
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation)
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation)
        
        let directionRequest = MKDirectionsRequest()
        directionRequest.source = MKMapItem(placemark: sourcePlacemark)
        directionRequest.destination = MKMapItem(placemark: destinationPlacemark)
        directionRequest.transportType = .automobile

        
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate { (directionResponse, error) in
             if error != nil
             {
                print("errosr")
        }
            if let route  = directionResponse?.routes[0] {
                self.map.add(route.polyline, level: .aboveRoads)
           let rect = route.polyline.boundingMapRect
               self.map.setVisibleMapRect(rect, edgePadding: UIEdgeInsetsMake(40.0, 40.0, 40, 40.0), animated: true)
             
            }
    }
    
}
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.blue
        renderer.lineWidth = 4.0
        return renderer
    }
}



extension DisplayPathViewController: UITableViewDataSource,UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayAddress.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.addressLabel.attributedText = arrayAddress[indexPath.row].attributedFullText
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        destinationTextField.text = arrayAddress[indexPath.row].attributedFullText.string
        GooglePlacesApi.obj.getPlaceDetail(placeId: arrayAddress[indexPath.row].placeID!) {(placeCordinate) in
           self.displayMap(destinationLatitude: placeCordinate.latitude,destinationLongitude: placeCordinate.longitude)
            print(placeCordinate.latitude)
        }
        tableView.isHidden = true
         map.isHidden = false
        
    }
}

extension DisplayPathViewController : UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let nsString = textField.text as NSString?
        let searchStr = nsString?.replacingCharacters(in: range, with: string)
        if searchStr == " "
        {
            self.arrayAddress = [GMSAutocompletePrediction] ()
        }
        else
        {
            GMSPlacesClient.shared().autocompleteQuery(searchStr!,bounds:nil,filter:nil,callback : { (result,error) in
                if error == nil && result != nil {
                    self.arrayAddress = result!
                    self.tableView.isHidden = false
                    self.map.isHidden = true
                    self.tableView.reloadData()
                }
            })
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text =  " "
    }
    
}


 

class CustomPin :NSObject,MKAnnotation
{
    var coordinate : CLLocationCoordinate2D
    var title : String?
    
    init(coordinate:CLLocationCoordinate2D,title:String) {
        self.coordinate = coordinate
        self.title = title
    }
}
