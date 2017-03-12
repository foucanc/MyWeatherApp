//
//  Weather.swift
//  MyWeatherApp
//
//  Created by Christophe Foucan on 12/03/2017.
//  Copyright © 2017 Christophe Foucan. All rights reserved.
//

import RealmSwift

class Weather: Object {
        
    dynamic var main = ""
    dynamic var weatherDescription = ""
    dynamic var temperature = 0.0
    dynamic var humidity = 0.0
    dynamic var name = ""

}
