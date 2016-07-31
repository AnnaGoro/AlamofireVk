//
//  VideoModel.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 7/30/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import ObjectMapper

class VideoModel:Mappable {
    
    var id : Int?
    var owner_id : Int?
    var title : String?
    var description : String?
    var duration : Int?
    var photo_130 : String? // url изображения-обложки ролика с размером 130x98px.
    var date : Int? // unixtime
    var adding_date : Int? //unixtime
    var views : Int?
    var comments : Int?
    
    var transformStringToInt = TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } })
    
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- (map["id"], transformStringToInt )
        owner_id <- (map["owner_id"], transformStringToInt )
        title <- map["title"]
        description <- map["description"]
        duration <- (map["duration"], transformStringToInt)
        date <- (map["date"], transformStringToInt )
        photo_130 <- map["photo_130"]
        adding_date <- (map["adding_date"], transformStringToInt )
        photo_130 <- map["photo_130"]
        views <- (map["views"], transformStringToInt )
        comments <- (map["comments"], transformStringToInt )
    }

    
    
    
/*
    init (id : Int,
    owner_id : Int,
    title : String,
    description : String,
    duration : Int,
    photo_130 : String,
    date : IntMax,
    adding_date : IntMax,
    views : Int?,
    comments : Int?) {
    
    
        self.id = id
        self.owner_id = owner_id
        self.title = title
        self.description = description
        self.duration = duration
        self.photo_130 = photo_130
        self.date = date
        self.adding_date = adding_date
        self.views = views
        self.comments = comments
    
    
    }

*/



}






