//
//  IconHelper.swift
//  MyWeatherApp
//
//  Created by Christophe Foucan on 18/08/2018.
//  Copyright © 2018 Christophe Foucan. All rights reserved.
//

import Foundation

class IconHelper {
    
    class func setIcon(type : String) -> String {
        
        var icon = ""
        
        switch type {
            
            case "01d":
                icon = "whiteclear"
            case "02d":
                icon = "whitepartlycloudy"
            case "03d":
                icon = "whitecloudy"
            case "04d":
                icon = "whitemostlycloudy"
            case "09d":
                icon = "whiterain"
            case "10d":
                icon = "whitechancerain"
            case "11d":
                icon = "whitestorm"
            case "13d":
                icon = "whiteflake"
            case "50d":
                icon = "whitefog"
            default:
                icon = ""
        }
        return icon
    }
}
