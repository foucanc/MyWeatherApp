//
//  MainViewModel.swift
//  MyWeatherApp
//
//  Created by Christophe Foucan on 12/03/2017.
//  Copyright © 2017 Christophe Foucan. All rights reserved.
//

import Bond
import Alamofire
import SwiftyJSON
import CoreLocation

class MainViewModel : NSObject {
    
    var weather = Observable<[Weather]?>(nil)

    func getCurrentWeather() {
        
        LocationService.shared.requestLocation(){ (updated, coord) in
            print(coord.latitude)
            print(coord.longitude)
            let parameters: Parameters = [
                "APPID": "2c50f7d7623f375e3e334ecaa83ce363",
                "lat": coord.latitude,
                "lon": coord.longitude
                //"lat": "45.508839",
                //"lon": "-73.587807"
            ]
            
            Alamofire.request(URL, parameters: parameters).responseJSON{response in
                //debugPrint(response.request)
                do {
                    let data: Data = response.data!
                    let json = JSON(data: data)
                    let datas = CurrentParser.shared.parseObjects(jsonDic: json) as! [Weather]
                    
                    DataService.shared.updateInfos(weatherObject: datas) { updated, error in
                        if(updated) {
                            print("Les infos ont étés récupérées")
                            
                        }
                    }
                    
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                    
                }
            }
        }
    }
}
