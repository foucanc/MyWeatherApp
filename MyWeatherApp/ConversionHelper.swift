//
//  ConversionHelper.swift
//  MyWeatherApp
//
//  Created by Christophe Foucan on 16/08/2018.
//  Copyright © 2018 Christophe Foucan. All rights reserved.
//

import Foundation

class ConversionHelper {
    
    class func mpersecToKmperh(from mpersec: Double ) -> Double {
        return mpersec*(60*60)/1000
    }
}
