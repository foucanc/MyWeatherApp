//
//  Parser.swift
//  MyWeatherApp
//
//  Created by Christophe Foucan on 18/03/2017.
//  Copyright © 2017 Christophe Foucan. All rights reserved.
//

import RealmSwift
import SwiftyJSON

protocol Parser {
    func parseObject(jsonDic: JSON) -> Object
    func parseObjects(jsonDic: JSON) -> [Object]
}
