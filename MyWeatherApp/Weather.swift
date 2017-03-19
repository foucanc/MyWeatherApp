//
//  Weather.swift
//  MyWeatherApp
//
//  Created by Christophe Foucan on 12/03/2017.
//  Copyright © 2017 Christophe Foucan. All rights reserved.
//

import RealmSwift

class Weather: Object {
        
    dynamic var country = ""
    dynamic var city = ""
    
    let forecast = List<Forecast>()
}
