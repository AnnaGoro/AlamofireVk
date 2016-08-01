//
//  AudioResponseModel.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 8/1/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import ObjectMapper

class AudioResponseModel: Mappable {
    
    
    var response : [AudioModel]?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        
        response <- map["response"]
    }
}
