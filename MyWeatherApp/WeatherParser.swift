//
//  WeatherParser.swift
//  MyWeatherApp
//
//  Created by Christophe Foucan on 03/04/2017.
//  Copyright © 2017 Christophe Foucan. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

struct WeatherParser: Parser {
    
    static var shared = WeatherParser()
    
    func parseObject(jsonDic: JSON) -> Object {
        let weather = self.weatherObj(dic: jsonDic)
        
        //country code conversion
        let countryCode = jsonDic["sys"]["country"].stringValue
        let currentLocale : NSLocale = NSLocale.init(localeIdentifier :  NSLocale.current.identifier)
        let countryName : String? = currentLocale.displayName(forKey: NSLocale.Key.countryCode, value: countryCode)
        
        var date: Date?
        if let dateDouble = jsonDic["dt"].double {
            date = Date(timeIntervalSince1970: dateDouble / 1000.0)
        }
        
        weather.city = jsonDic["name"].stringValue
        weather.country = countryName ?? ""
        weather.dt = date
        
        weather.temp = jsonDic["main"]["temp"].doubleValue
        weather.temp_max = jsonDic["main"]["temp_max"].intValue
        weather.temp_min = jsonDic["main"]["temp_min"].intValue
        weather.pressure = jsonDic["main"]["pressure"].intValue
        weather.humidity = jsonDic["main"]["humidity"].intValue
        weather.clouds = jsonDic["clouds"]["all"].intValue
        weather.speed = jsonDic["wind"]["speed"].doubleValue
        
        return weather
    }
    
    func parseObjects(jsonDic: JSON) -> [Object] {
        let infos = [Weather]()
        return infos
    }
    
    func weatherObj(dic: JSON) -> Weather {
        let weather = Weather()
        
        for index in dic["weather"] {
            let weatherCondition = WeatherCondition()
            weatherCondition.id = index.1["id"].intValue
            weatherCondition.main = index.1["main"].stringValue
            weatherCondition.icon = index.1["icon"].stringValue
            weatherCondition.weatherDescription = index.1["description"].stringValue
            
            weather.weatherCondition.append(weatherCondition)
        }
        
        return weather
    }
}
