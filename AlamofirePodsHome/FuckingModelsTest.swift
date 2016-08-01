//
//  FuckingModelsTest.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 8/1/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherResponse: Mappable {
    
    
   
        var location: String?
        var threeDayForecast: [Forecast]?
        var fuck: String?
        required init?(_ map: Map){
            
        }
        
        func mapping(map: Map) {
            location <- map["location"]
            threeDayForecast <- map["three_day_forecast"]
            fuck <- map["fuck"]
        }
    }
    
    class Forecast: Mappable {
        var day: String?
        var temperature: Int?
        var conditions: String?
        
        required init?(_ map: Map){
            
        }
        
        func mapping(map: Map) {
            day <- map["day"]
            temperature <- map["temperature"]
            conditions <- map["conditions"]
        }
    }

