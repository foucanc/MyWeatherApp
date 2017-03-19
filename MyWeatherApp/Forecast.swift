//
//  Forecast.swift
//  MyWeatherApp
//
//  Created by Christophe Foucan on 18/03/2017.
//  Copyright © 2017 Christophe Foucan. All rights reserved.
//

import RealmSwift

class Forecast: Object {
    
    //main
    dynamic var humidity = 0
    dynamic var temp_min = 0.0
    dynamic var temp_max = 0.0
    dynamic var temp = 0.0
    dynamic var pressure = 0.0
    
    //clouds
    dynamic var clouds = 0
    
    //weather
    dynamic var id = 0
    dynamic var main = ""
    dynamic var icon = ""
    dynamic var weatherDescription = ""
    
    //time
    //dynamic var dt: Date?
    dynamic var dt_txt = ""
    
    //rain
    dynamic var rain = 0.0
    
    //wind
    dynamic var speed = 0.0
    dynamic var deg = 0.0
    
    //Description: https://openweathermap.org/forecast5

}
