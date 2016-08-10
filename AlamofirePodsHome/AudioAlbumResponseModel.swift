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
    
    
     var response  : AudioAlbumListResponseModel?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        
        
        response <- map["response"]
       
        
    }
}