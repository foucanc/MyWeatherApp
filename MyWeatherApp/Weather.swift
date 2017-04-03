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
    
    let dailyForecast = List<DailyForecast>()
    let hourForecast = List<HourForecast>()
}
