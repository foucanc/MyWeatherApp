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

    func getWeather() {
        
        let url = URL + String(describing: WEATHER_TYPE.WEATHER.rawValue)
        
        LocationService.shared.requestLocation(){ (updated, coord) in
            print(coord.latitude)
            print(coord.longitude)
            let parameters: Parameters = [
                "APPID": "2c50f7d7623f375e3e334ecaa83ce363",
                "lat": coord.latitude,
                "lon": coord.longitude,
                "units": "metric"
            ]
            
            Alamofire.request(url, parameters: parameters).responseJSON{response in
                //debugPrint(response.request)
                print(url)
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
    
    func getForecast() {
        
        let url = URL + String(describing: WEATHER_TYPE.FORECAST.rawValue)
        
        LocationService.shared.requestLocation(){ (updated, coord) in
            print(coord.latitude)
            print(coord.longitude)
            let parameters: Parameters = [
                "APPID": "2c50f7d7623f375e3e334ecaa83ce363",
                "lat": coord.latitude,
                "lon": coord.longitude,
                "units": "metric"
            ]
            
            Alamofire.request(url, parameters: parameters).responseJSON{response in
                debugPrint(response.request!)
                do {
                    let data: Data = response.data!
                    let json = JSON(data: data)

                    let datas = ForecastParser.shared.parseObjects(jsonDic: json) as! [Weather]
                    
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
