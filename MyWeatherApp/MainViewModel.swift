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
    var lat : String = ""
    var lon : String = ""
    // MARK: Daily Forecast
    func getDailyForecast() {
        
        let url = URL + String(describing: WEATHER_TYPE.daily.rawValue)
        
        LocationService.shared.requestLocation(){ (updated, coord) in
            
            lat = String(coord.latitude)
            lon = String(coord.longitude)
            
            let parameters: Parameters = [
                "APPID": API_KEY,
                "lat": coord.latitude,
                "lon": coord.longitude,
                "units": "metric",
                "cnt": 5
            ]
            
            Alamofire.request(url, parameters: parameters).responseJSON{response in
                if response.data != nil {
                    let data: Data = response.data!
                    let json = JSON(data: data)
                    
                    let datas = DailyForecastParser.shared.parseObject(jsonDic: json) as! Weather
                    self.getHourForecast(object: datas)
                }
                else {
                    print("Failed to load: \(String(describing: response.error?.localizedDescription))")
                }
            }
        }
    }
    
    // MARK: Hour Forecast
    func getHourForecast(object: Weather) {
        
        let url = URL + String(describing: WEATHER_TYPE.forecast.rawValue)
        
        let parameters: Parameters = [
            "APPID": API_KEY,
            "lat": lat,
            "lon": lon,
            "units": "metric"
        ]
        
        Alamofire.request(url, parameters: parameters).responseJSON{response in
            //debugPrint(response.request!)
            if response.data != nil {
                let data: Data = response.data!
                let json = JSON(data: data)
                let datas = HourForecastParser.shared.parseObjects(jsonDic: json) as! [HourForecast]
                
                DataService.shared.updateInfos(weatherObject: object, hourObject: datas) { updated, error in
                    if(updated) {
                        
                    }
                }
            }
            else {
                print("Failed to load: \(String(describing: response.error?.localizedDescription))")
            }
        }

    }

}
