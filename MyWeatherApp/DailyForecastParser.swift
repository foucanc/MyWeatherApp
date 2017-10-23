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
        let info = Weather()
        return info
    }
    
    func parseObjects(jsonDic: JSON) -> [Object] {
        var infos = [DailyForecast]()
        //print(jsonDic)
        for index in jsonDic["list"] {
            let weather = self.weatherObj(dic: index.1)
            infos.append(weather)
        }
        //print(infos)
        return infos
    }
    
    func weatherObj(dic: JSON) -> DailyForecast {
        let forecast = DailyForecast()
        
        forecast.humidity = dic["main"]["humidity"].intValue
        forecast.min = dic["temp"]["min"].doubleValue
        forecast.max = dic["temp"]["max"].doubleValue
        forecast.day = dic["temp"]["day"].doubleValue
        forecast.night = dic["temp"]["night"].doubleValue
        forecast.pressure = dic["main"]["pressure"].doubleValue

        forecast.clouds = dic["clouds"].intValue
        
        forecast.id = dic["weather"][0]["id"].intValue
        forecast.main = dic["weather"][0]["main"].stringValue
        forecast.icon = dic["weather"][0]["icon"].stringValue
        forecast.weatherDescription = dic["weather"][0]["description"].stringValue
        
//            //forecast.dt = dutytime
        
        forecast.speed = dic["speed"].doubleValue
        forecast.deg = dic["deg"].doubleValue
            

        return forecast
    }
}
