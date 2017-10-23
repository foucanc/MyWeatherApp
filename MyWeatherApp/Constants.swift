//
//  Constants.swift
//  MyWeatherApp
//
//  Created by Christophe Foucan on 12/03/2017.
//  Copyright © 2017 Christophe Foucan. All rights reserved.
//

import Foundation

let URL = "http://api.openweathermap.org/data/2.5/"
let API_KEY = "YOUR_API_KEY"

enum WEATHER_TYPE : String {
    case weather = "weather"
    case forecast = "forecast"
    case daily = "forecast/daily"
}
