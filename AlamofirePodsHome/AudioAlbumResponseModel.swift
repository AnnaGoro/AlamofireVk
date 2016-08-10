//
//  AudioAlbumResponseModel.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 8/9/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import ObjectMapper

class AudioAlbumResponseModel : Mappable {
    //var count : Int?
    var response : [AudioAlbumModel]?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        
       //count <- map["count"]
        response <- map["response"]
       
        
    }
}