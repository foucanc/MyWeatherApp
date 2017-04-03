//
//  DailyForecast.swift
//  MyWeatherApp
//
//  Created by Christophe Foucan on 30/03/2017.
//  Copyright © 2017 Christophe Foucan. All rights reserved.
//

import RealmSwift

class DailyForecast: Object {
    
    //main
    dynamic var humidity = 0
    dynamic var min = 0.0 //min daily temperature
    dynamic var max = 0.0 //max daily temperature
    dynamic var day = 0.0 //day temperature
    dynamic var night = 0.0 //night temperature
    dynamic var pressure = 0.0
    
    //clouds
    dynamic var clouds = 0
    
    //weather
    dynamic var id = 0
    dynamic var main = ""
    dynamic var icon = ""
    dynamic var weatherDescription = ""
    
    //time
    dynamic var dt: Date?
    
    //wind
    dynamic var speed = 0.0
    dynamic var deg = 0.0
}
