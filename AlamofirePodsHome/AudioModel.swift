//
//  AudioModel.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 7/30/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import ObjectMapper

class AudioModel:Mappable {

    var id : Int?
    var owner_id : Int?
    var artist : String?
    var title : String?
    var duration : Int?
    var url : String?
    var lyrics_id : Int?
    var album_id : Int?
    var genre_id : Int?
    var date : NSDate?
    var no_search : Int?
    
    
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- (map["id"])
        owner_id <- (map["owner_id"])
        title <- map["title"]
        duration <- (map["duration"])
        url <- map["url"]
        lyrics_id <- (map["lyrics_id"])
        album_id <- (map["album_id"] )
        genre_id <- (map["genre_id"])
        date <- (map["date"], DateTransform() )
        no_search <- (map["no_search"] )
    }

   }

