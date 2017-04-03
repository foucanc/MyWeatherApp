//
//  DataService.swift
//  MyWeatherApp
//
//  Created by Christophe Foucan on 12/03/2017.
//  Copyright © 2017 Christophe Foucan. All rights reserved.
//

import RealmSwift
import Bond

class DataService: NSObject {
    static var shared = DataService()
    var weather = Observable<Weather?>(nil)
    
    func updateInfos(weatherObject: Weather, hourObject: [HourForecast], completion: (Bool, Error?) -> Void) {
        do {
            
            let realm = try Realm()
            
            realm.beginWrite()
            let oldInfos = realm.objects(Weather.self)
            realm.delete(oldInfos)
            try realm.commitWrite()
            
            realm.beginWrite()
            weatherObject.hourForecast.append(objectsIn: hourObject)
            realm.add(weatherObject, update: true)
            try realm.commitWrite()
            
            self.weather.value = weatherObject
            
            completion(true, nil)
        }
        catch {
            print(error)
            completion(false, error)
        }
    }
}
