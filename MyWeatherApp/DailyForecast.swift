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
    @objc dynamic var humidity = 0
    @objc dynamic var min = 0.0 //min daily temperature
    @objc dynamic var max = 0.0 //max daily temperature
    @objc dynamic var day = 0.0 //day temperature
    @objc dynamic var night = 0.0 //night temperature
    @objc dynamic var pressure = 0.0
    
    //clouds
    @objc dynamic var clouds = 0
    
    //weather
    @objc dynamic var id = 0
    @objc dynamic var main = ""
    @objc dynamic var icon = ""
    @objc dynamic var weatherDescription = ""
    
    //time
    @objc dynamic var dt: Date?
    
    //wind
    @objc dynamic var speed = 0.0
    @objc dynamic var deg = 0.0
}
