//
//  Forecast.swift
//  MyWeatherApp
//
//  Created by Christophe Foucan on 18/03/2017.
//  Copyright © 2017 Christophe Foucan. All rights reserved.
//

import RealmSwift

class HourForecast: Object {
    
    //main
    @objc dynamic var humidity = 0
    @objc dynamic var temp_min = 0.0
    @objc dynamic var temp_max = 0.0
    @objc dynamic var temp = 0.0
    @objc dynamic var pressure = 0.0
    
    //clouds
    @objc dynamic var clouds = 0
    
    //weather
    @objc dynamic var id = 0
    @objc dynamic var main = ""
    @objc dynamic var icon = ""
    @objc dynamic var weatherDescription = ""
    
    //time
    //@objc dynamic var dt: Date?
    @objc dynamic var dt_txt = ""
    
    //rain
    @objc dynamic var rain = 0.0
    
    //wind
    @objc dynamic var speed = 0.0
    @objc dynamic var deg = 0.0

}
