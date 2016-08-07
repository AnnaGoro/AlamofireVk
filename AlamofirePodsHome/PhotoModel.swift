//
//  PhotoModel.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 7/30/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import ObjectMapper

class  PhotoModel:Mappable {

    var id : Int?
    var album_id : Int?
    var owner_id : Int?
    var user_id : Int?
    var text : String?
    var date : NSDate? //unix time
    var src_small : String?
    var src_xbig: String?
    
   
    
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        album_id <- map["album_id"]
        owner_id <- map["owner_id"]
        user_id <- map["user_id"]
        text <- map["text"]
        date <- (map["date"], DateTransform())
        src_small <- map["src_small"]
        src_xbig <- map["src_xbig"]
        
    }

    
    


}