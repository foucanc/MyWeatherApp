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
        //print(dic)
        
//        weather.name = dic["name"].stringValue
//        weather.humidity = dic["main"]["humidity"].doubleValue
//        weather.temperature = dic["main"]["temp"].doubleValue
//        weather.main = dic["weather"][0]["main"].stringValue
//        weather.weatherDescription = dic["weather"][0]["description"].stringValue
        
        
        return weather
    }
}
