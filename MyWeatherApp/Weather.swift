//
//  Weather.swift
//  MyWeatherApp
//
//  Created by Christophe Foucan on 12/03/2017.
//  Copyright © 2017 Christophe Foucan. All rights reserved.
//

import RealmSwift

class Weather: Object {
    
    override static func primaryKey() -> String? {
        return "city"
    }
    
    dynamic var country = ""
    dynamic var city = ""
    dynamic var dt : Date?
    
    dynamic var temp = 0.0
    dynamic var temp_max = 0
    dynamic var temp_min = 0
    dynamic var pressure = 0
    dynamic var humidity = 0
    dynamic var clouds = 0

    let weatherCondition = List<WeatherCondition>()
    
    let dailyForecast = List<DailyForecast>()
    let hourForecast = List<HourForecast>()
}

class WeatherCondition: Object {
    dynamic var id = 0
    dynamic var main = ""
    dynamic var icon = ""
    dynamic var weatherDescription = ""
}
