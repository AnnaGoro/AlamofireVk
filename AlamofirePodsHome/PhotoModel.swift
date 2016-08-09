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
    var src_xxbig : String?
    var src_xxxbig : String?
    var src_big : String?
    var src : String?
    
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
        src_xxbig <- map["src_xxbig"]
        src_xxxbig <- map["src_xxxbig"]
        src_big <- map["src_big"]
        src <- map["src"]
    }

    
    


}