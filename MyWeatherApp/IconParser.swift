//
//  IconParser.swift
//  MyWeatherApp
//
//  Created by Christophe Foucan on 22/09/2017.
//  Copyright © 2017 Christophe Foucan. All rights reserved.
//

import UIKit
import SwiftyJSON
import RealmSwift

struct IconParser: Parser {
    
    static var shared = IconParser()
    
    func parseObject(jsonDic: JSON) -> Object {
        let info = Weather()
        return info
    }
    
    func parseObjects(jsonDic: JSON) -> [Object] {
        let infos = [Weather]()
        return infos
    }

}
