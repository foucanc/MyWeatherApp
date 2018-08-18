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
    
    @objc dynamic var country = ""
    @objc dynamic var city = ""
    @objc dynamic var dt : Date?
    
    @objc dynamic var temp = 0.0
    @objc dynamic var temp_max = 0
    @objc dynamic var temp_min = 0
    @objc dynamic var pressure = 0
    @objc dynamic var humidity = 0
    @objc dynamic var clouds = 0
    @objc dynamic var speed = 0.0
    
    let weatherCondition = List<WeatherCondition>()
    
    let dailyForecast = List<DailyForecast>()
    let hourForecast = List<HourForecast>()
}

class WeatherCondition: Object {
    @objc dynamic var id = 0
    @objc dynamic var main = ""
    @objc dynamic var icon = ""
    @objc dynamic var weatherDescription = ""
}
