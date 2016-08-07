//
//  AlbumResponseModel.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 8/7/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import ObjectMapper

class AlbumResponseModel: Mappable {
    
    
    var response : [AlbumModel]?
    var count : Int?
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        
        response <- map["response"]
        count <- map ["count"]
    }
}

