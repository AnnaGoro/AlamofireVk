//
//  AlbumModel.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 8/7/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import ObjectMapper

class AlbumModel:Mappable {
    
    var aid : Int?
    var owner_id : Int?
    
    var thumb_id : Int?
    var thumb_src : String?
    
    var title : String?
    var description : String?
   
    var created : Int?
    var updated : Int?
    
    var size :  Int?
    var thumb_is_last : Int?
    var privacy_view : [String]?
    var privacy_comment : [String]?
    
    
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        aid <- (map["aid"])
        owner_id <- (map["owner_id"])
        title <- map["title"]
        thumb_id <- (map["thumb_id"])
        thumb_src <- map["thumb_src"]
        description <- (map["description"])
        created <- (map["created"] )
        updated <- (map["updated"])
        size <- map["size"]
        thumb_is_last <- (map["thumb_is_last"] )
        privacy_view <- (map["privacy_view"] )
        privacy_comment <- (map["privacy_comment"] )
}
}
