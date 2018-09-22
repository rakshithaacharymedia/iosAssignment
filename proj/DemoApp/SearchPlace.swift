//
//  SearchPlace.swift
//  DemoApp
//
//  Created by rakshitha on 21/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import Foundation

class searchLocation{
    
   static let obj = searchLocation()
    
   func searchByName(placeName:String)
     {
   let urlForSearch="https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=\(placeName)&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key=AIzaSyBGOVvrHspeVjtaQsj0N6jqYdrwVsHsBQE"

        let dataSession = URLSession(configuration:.default)
        let dataTask : URLSessionDataTask?
        let url = URL(string:urlForSearch)

    dataTask = dataSession.dataTask(with: url!) {(data,response, error) in
        if error == nil
        {
            do {
                if let data =  data{
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    print(json ?? "no value")
                    if let candidate = json! ["candidates"] as? [[String:Any]]
                    {

                           if  let address = candidate.first {
                             if let address2 = address["formatted_address"] as? String
                             {

                                print(address2)
                        }
                }
            }
            }
            }
            catch
            {
                print("error")
            }
        }
    }
    dataTask?.resume()
}
    
//    func searchByName(placeName:String)
//    {
//        var urlForSearch = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=\(placeName)&key=AIzaSyBGOVvrHspeVjtaQsj0N6jqYdrwVsHsBQE"
//        urlForSearch = urlForSearch.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
//        var urlRequest = URLRequest(url:(URL(string:urlForSearch))!)
//        urlRequest.httpMethod = "GET"
//        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
//            if error != nil
//            {
//                print("error")
//            }
//            do{
//            if let data = data{
//                let json = try JSONSerialization.jsonObject(with: data, options:[]) as? [String:Any]
//                print(json)
//
//            }
//        }
//            catch
//            {
//                print("error")
//            }
//    }
//        task.resume()
//}
}
