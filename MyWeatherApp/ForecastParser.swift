//
//  ForecastParser.swift
//  MyWeatherApp
//
//  Created by Christophe Foucan on 18/03/2017.
//  Copyright © 2017 Christophe Foucan. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

struct ForecastParser: Parser {
    
    static var shared = ForecastParser()
    
    func parseObjects(jsonDic: JSON) -> [Object] {
        var infos = [Weather]()
        
        if let json = jsonDic as? JSON {
            
            let weather = self.weatherObj(dic: json)
            
            let countryCode = jsonDic["city"]["country"].stringValue
            let currentLocale : NSLocale = NSLocale.init(localeIdentifier :  NSLocale.current.identifier)
            let countryName : String? = currentLocale.displayName(forKey: NSLocale.Key.countryCode, value: countryCode)
            
            weather.city = jsonDic["city"]["name"].stringValue
            weather.country = countryName ?? ""
            
            infos.append(weather)
        }
        return infos
    }
    
    func weatherObj(dic: JSON) -> Weather {
        let weather = Weather()

        for index in dic["list"] {
            let forecast = Forecast()
            
            forecast.humidity = index.1["main"]["humidity"].intValue
            forecast.temp_min = index.1["main"]["temp_min"].doubleValue
            forecast.temp_max = index.1["main"]["temp_max"].doubleValue
            forecast.temp = index.1["main"]["temp"].doubleValue
            forecast.pressure = index.1["main"]["humidity"].doubleValue
            
            forecast.clouds = index.1["clouds"]["all"].intValue
            
            forecast.id = index.1["weather"]["id"].intValue
            forecast.main = index.1["weather"]["main"].stringValue
            forecast.icon = index.1["weather"]["icon"].stringValue
            forecast.weatherDescription = index.1["weather"]["description"].stringValue
            
            forecast.dt_txt = index.1["dt_txt"].stringValue
            
            forecast.rain = index.1["rain"]["3h"].doubleValue
            
            forecast.speed = index.1["wind"]["speed"].doubleValue
            forecast.deg = index.1["wind"]["deg"].doubleValue
            
            weather.forecast.append(forecast)
        }
        return weather
    }
}
