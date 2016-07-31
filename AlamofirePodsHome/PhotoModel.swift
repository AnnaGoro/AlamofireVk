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
    
    
    var transformStringToInt = TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } })
    
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- (map["id"], transformStringToInt )
        album_id <- (map["album_id"], transformStringToInt )
        owner_id <- (map["owner_id"], transformStringToInt )
        user_id <- (map["user_id"], transformStringToInt )
        text <- map["text"]
        date <- (map["date"], DateTransform())
    }

    
    
    // TODO: parameter photo_sizes=1 with urls  https://new.vk.com/dev/photo
    
    /*
    init (id : Int,
    album_id : Int,
    owner_id : Int,
    user_id : Int?,
    text : String?,
    date : IntMax) {
        
        
        self.id = id
        self.album_id = album_id
        self.owner_id = owner_id
        self.user_id = user_id
        self.text = text
        self.date = date
        
    }
*/

}