//
//  LocationFunction.swift
//  DemoApp
//
//  Created by rakshitha on 20/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import Foundation
import GoogleMaps
import GooglePlaces
import CoreLocation


class location{
    
    var lat :Double = 0.0
    var lng :Double = 0.0
    var type:String = " "
    var name:String = " "
    var icon :String = ""
    var vicinity :String = " "
    
    static let obj = location()
    
    init() {
        
    }
    init(dictObj:[String:Any])
    {
        if let lat = dictObj["lat"]
        {
            self.lat = lat as! Double
        }
        if let lng = dictObj["lng"]
        {
            self.lng = lng as! Double
        }
        if let type = dictObj["type"]
        {
            self.type = type as! String
        }
        if let name = dictObj["name"]
        {
            self.name = name as! String
        }
        if let icon = dictObj["icon"]
        {
            self.icon  = icon as! String
        }
        if let vicinity = dictObj["vicinity"]
        {
            self.vicinity = vicinity as! String
        }
    }
    
    //get nearby places for given latitude and longitude
    func getNearbyplace(latitude:Double,longitude:Double,handler: @escaping ([location]) -> Void)
    {
        var placesArray = [location] ()
        var placeDetail = [String: Any]()
        let urlForNearbySearch = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(latitude),\(longitude)&radius=1500&key=AIzaSyBGOVvrHspeVjtaQsj0N6jqYdrwVsHsBQE"
        let dataSession = URLSession(configuration:.default)
        let task : URLSessionDataTask?
        let url = URL(string:urlForNearbySearch)
    
        task = dataSession.dataTask(with: url!) {(data,response, error) in
            if error == nil
            {
                do {
                if let data =  data{
                   let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                  print(json ?? "no value")
                    if let result = json!["results"] as? [[String:Any]]
                    {
                        for obj in result.enumerated()
                        {
                            print(obj)
                            if let dict = obj.element as? [String:Any]
                            {
                                if let geometry = dict["geometry"] as? [String:Any]
                                {
                                    if let location = geometry["location"] as? [String:Any]
                                    {
                                       placeDetail["lat"] = location["lat"]
                                        placeDetail["lng"] = location["lng"]
                                    }
                                }
                                if let type = dict["types"] as? [String]
                                {
                                    placeDetail["type"] = type[0]
                                }
                                if let name = dict["name"]
                                {
                                    placeDetail["name"]  = name
                                }
                                if let icon = dict["icon"]
                                {
                                    placeDetail["icon"] = icon
                                }
                                if let vicinity = dict["vicinity"]
                                {
                                    placeDetail["vicinity"] = vicinity
                                }
                                print(placeDetail)
                                if let locationObj = try? location(dictObj: placeDetail)
                                {
                                    placesArray.append(locationObj)
                                }
                                
                               
                                placeDetail.removeAll()
                            }
                        
                        }
                        DispatchQueue.main.async {
                            handler(placesArray)
                        }
                        
                        }
                       
                     }
                   }
                catch
                {
                    print("error")
                    return
                }
            }
       }
         task?.resume()
        
    }
    
    //get image for marker from web
    func getImageFromWeb(url: String, closure: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else {
            return closure(nil)
        }
        let task = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("error: \(String(describing: error))")
                return closure(nil)
            }
            guard response != nil else {
                print("no response")
                return closure(nil)
            }
            guard data != nil else {
                print("no data")
                return closure(nil)
            }
            DispatchQueue.main.async {
                closure(UIImage(data: data!))
            }
        }
        task.resume()
    }
    
    
    //get address from given latitude and longitude
    func getAddress(latitudes:Double,longitudes:Double,handler: @escaping ([String:Any]) -> Void)
    {
        var address = [String: Any]()
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: latitudes, longitude: longitudes)

        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in

            if (error) == nil {
                
                if let place = placemarks?[0] {
                    if let locality = place.locality
                    {
                        address["locality"] = locality
                    }
                    if let sublocality = place.subLocality
                    {
                        address["sublocality"] = sublocality
                    }
                    if let country = place.country
                    {
                        address["country"] = country
                    }
                    if let postalcode = place.postalCode
                    {
                        address["postalcode"] = postalcode
                    }
                    
          }
            handler(address)
            }
    })
}
    
    
   
    
   


}
