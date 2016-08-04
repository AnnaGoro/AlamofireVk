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
    
      var transformStringToInt = TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } })
    
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

    
    /*
    init (id : Int, owner_id : Int, artist : String, title : String, duration : Int,  url : String, lyrics_id : Int, album_id : Int, genre_id : Int, date : NSDate, no_search : Int? ) {
        
        self.id = id
        self.owner_id = owner_id
        self.artist = artist
        self.title = title
        self.duration = duration
        self.url = url
        self.lyrics_id = lyrics_id
        self.album_id = album_id
        self.genre_id = genre_id
        self.date = date
        self.no_search = no_search
    
    }
    
    */
}

