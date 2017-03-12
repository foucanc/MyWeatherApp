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
    var weather = Observable<[Weather]?>(nil)
    
    func updateInfos(weatherObject: [Weather], completion: (Bool, Error?) -> Void) {
        
        print(weatherObject)
        
        do {
            
            let realm = try Realm()
            
            realm.beginWrite()
            realm.delete(realm.objects(Weather.self))
            realm.add(weatherObject)
            
            try realm.commitWrite()
            
            self.weather.value = weatherObject
            
            completion(true, nil)
        }
        catch {
            completion(false, error)
        }
    }
}
