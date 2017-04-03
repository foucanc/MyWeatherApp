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

struct HourForecastParser: Parser {
    
    static var shared = HourForecastParser()
    
    func parseObject(jsonDic: JSON) -> Object {
        let info = Weather()
        return info
    }
    
    func parseObjects(jsonDic: JSON) -> [Object] {
        var infos = [HourForecast]()
        
        for index in jsonDic["list"] {
            let weather = self.weatherObj(dic: index.1)
            infos.append(weather)
        }

        return infos
    }
    
    func weatherObj(dic: JSON) -> HourForecast {
        let forecast = HourForecast()
        
        forecast.humidity = dic["main"]["humidity"].intValue
        forecast.temp_min = dic["main"]["temp_min"].doubleValue
        forecast.temp_max = dic["main"]["temp_max"].doubleValue
        forecast.temp = dic["main"]["temp"].doubleValue
        forecast.pressure = dic["main"]["pressure"].doubleValue
        
        forecast.clouds = dic["clouds"]["all"].intValue
        
        forecast.id = dic["weather"][0]["id"].intValue
        forecast.main = dic["weather"][0]["main"].stringValue
        forecast.icon = dic["weather"][0]["icon"].stringValue
        forecast.weatherDescription = dic["weather"][0]["description"].stringValue
        
        forecast.dt_txt = dic["dt_txt"].stringValue
        
        forecast.rain = dic["rain"]["3h"].doubleValue
        
        forecast.speed = dic["wind"]["speed"].doubleValue
        forecast.deg = dic["wind"]["deg"].doubleValue
            
        return forecast
    }
}
