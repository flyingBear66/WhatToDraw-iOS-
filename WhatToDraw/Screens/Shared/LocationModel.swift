//
//  LokmaModel.swift
//  WhatToDraw
//
//  Created by Ozgun Zor on 29/05/2017.
//  Copyright © 2017 Ozgun Zor. All rights reserved.
//

import Foundation
import ObjectMapper

class LocationModel: WTDModel, Mappable {
    
    var latitude: Double!
    var longitude: Double!
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }
}
