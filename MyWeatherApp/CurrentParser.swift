//
//  WeatherParser.swift
//  MyWeatherApp
//
//  Created by Christophe Foucan on 12/03/2017.
//  Copyright © 2017 Christophe Foucan. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift

protocol Parser {
    func parseObjects(jsonDic: JSON) -> [Object]
}

struct CurrentParser: Parser {
    
    static var shared = CurrentParser()
    
    func parseObjects(jsonDic: JSON) -> [Object] {
        var infos = [Weather]()
        
        if let json = jsonDic as? JSON {
            let weather = self.weatherObj(dic: json)
            infos.append(weather)
        }
        //print(infos)
        return infos
    }
    
    func weatherObj(dic: JSON) -> Weather {
        let weather = Weather()
        
        weather.name = dic["name"].string!
        weather.humidity = dic["main"]["humidity"].double!
        weather.temperature = dic["main"]["temp"].double!
        weather.main = dic["weather"][0]["main"].string!
        weather.weatherDescription = dic["weather"][0]["description"].string!
        
        
        return weather
    }
    
    
}
