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
    
    func getForecast() {
        
        let url = URL + String(describing: WEATHER_TYPE.FORECAST.rawValue)
        
        LocationService.shared.requestLocation(){ (updated, coord) in
            let parameters: Parameters = [
                "APPID": API_KEY,
                "lat": coord.latitude,
                "lon": coord.longitude,
                "units": "metric"
            ]
            
            Alamofire.request(url, parameters: parameters).responseJSON{response in
                //debugPrint(response.request!)
                do {
                    let data: Data = response.data!
                    let json = JSON(data: data)

                    let datas = ForecastParser.shared.parseObjects(jsonDic: json) as! [Weather]
                    
                    DataService.shared.updateInfos(weatherObject: datas) { updated, error in
                        if(updated) {
                            
                        }
                    }
                    
                } catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                    
                }
            }
        }
    }
}
