//
//  DataStore.swift
//  DemoApp
//
//  Created by rakshitha on 22/09/18.
//  Copyright © 2018 rakshitha. All rights reserved.
//

import Foundation
import CoreData
import UIKit

struct LocationDetail
    
{
    var name:String = " "
    var type :String = " "
    var latitude :Double = 0.0
    var longitude :Double = 0.0
    var vicinity :String = " "
    var icon :String = " "
    
    init(name:String,type:String,latitude:Double,longitude:Double,icon:String,vicinity:String) {
        self.name = name
        self.type = type
        self.latitude = latitude
        self.longitude = longitude
        self.icon = icon
        self.vicinity = vicinity
    }
}


class DataStore {
    
    
    static let obj = DataStore()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func insert(place: GooglePlacesApi)
    {
       
     if let entity = NSEntityDescription.insertNewObject(forEntityName: "Place", into: context) as? Place
     {
        
        
        entity.latitude = place.lat
        entity.longitude = place.lng
        entity.name = place.name
        entity.typeofPlace = place.type
        entity.vicinity = place.vicinity
        entity.icon = place.icon 
    
        
        do {
            try context.save()
          }
        catch {
            print("error")
        }
    }
       
    }
    
    func fetch() -> [Place]
    {
        
        let request = NSFetchRequest<Place>(entityName: "Place")
        var result = [Place]()
        do {
            result = try context.fetch(request)
          }
        catch {
            print("error")
        }
        return result
    }
    
}
