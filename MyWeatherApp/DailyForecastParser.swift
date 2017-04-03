//
//  DailyForecastParser.swift
//  MyWeatherApp
//
//  Created by Christophe Foucan on 30/03/2017.
//  Copyright © 2017 Christophe Foucan. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

struct DailyForecastParser: Parser {
    
    static var shared = DailyForecastParser()
    
    func parseObject(jsonDic: JSON) -> Object {
        let weather = self.weatherObj(dic: jsonDic)
        
        let countryCode = jsonDic["city"]["country"].stringValue
        let currentLocale : NSLocale = NSLocale.init(localeIdentifier :  NSLocale.current.identifier)
        let countryName : String? = currentLocale.displayName(forKey: NSLocale.Key.countryCode, value: countryCode)
        weather.city = jsonDic["city"]["name"].stringValue
        weather.country = countryName ?? ""

        return weather
    }
    
    func parseObjects(jsonDic: JSON) -> [Object] {
        let infos = [Weather]()
        return infos
    }
    
    func weatherObj(dic: JSON) -> Weather {
        let weather = Weather()
        
        for index in dic["list"] {
            let forecast = DailyForecast()
            
            forecast.humidity = index.1["main"]["humidity"].intValue
            forecast.min = index.1["temp"]["min"].doubleValue
            forecast.max = index.1["temp"]["max"].doubleValue
            forecast.day = index.1["temp"]["day"].doubleValue
            forecast.night = index.1["temp"]["night"].doubleValue
            forecast.pressure = index.1["main"]["pressure"].doubleValue

            forecast.clouds = index.1["clouds"].intValue
            
            forecast.id = index.1["weather"][0]["id"].intValue
            forecast.main = index.1["weather"][0]["main"].stringValue
            forecast.icon = index.1["weather"][0]["icon"].stringValue
            forecast.weatherDescription = index.1["weather"][0]["description"].stringValue
            
//            //forecast.dt = dutytime
            
            forecast.speed = index.1["speed"].doubleValue
            forecast.deg = index.1["deg"].doubleValue
            
            weather.dailyForecast.append(forecast)
        }
        
        return weather
    }
}
