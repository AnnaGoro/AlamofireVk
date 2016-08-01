//
//  UserModel.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 7/30/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import ObjectMapper

class UserModel: Mappable {

    var id: Int?
    var first_name: String?
    var last_name: String?
  //  var photo_50 : String? // url
    
    //  deleted или banned if returns
    
    var deactivated : String?
   
    /*  возвращается 1 при вызове без access_token, если пользователь установил настройку «Кому в интернете видна моя страница» — «Только пользователям ВКонтакте». */
    
    var hidden : Int?
    
    
    //  DD.MM.YYYY или DD.MM (если год рождения скрыт). Если дата рождения скрыта целиком, поле отсутствует в ответе.
    
    var bdate: String?
   // var books : String?
   // var interests : String?
   // var home_town : String?
    
    

     var transform = TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } })
    
    
    required init?(_ map: Map){
       // mapping(map)
    }
    

    
    func mapping(map: Map) {
         id <- (map["id"], transform)
         first_name <- map["first_name"]
         last_name <- map["last_name"]
        // photo_50 <- map["photo_50"]
         deactivated <- map["deactivated"]
         hidden <- (map["hidden"], transform )
         bdate <- map["bdate"]
        // books <- map["books"]
       //  interests <- map["interests"]
        // home_town <- map["home_town"]
        
    }
    
    /*
    init (id : Int,
    first_name : String,
    last_name : String,
    photo_50 : String,
    deactivated : String?,
    hidden : Int,
    bdate : String?,
    books : String?,
    interests : String?,
    home_town : String?) {
    
        self.id = id
        self.first_name = first_name
        self.last_name = last_name
        self.photo_50 = photo_50
        self.deactivated = deactivated
        self.hidden = hidden
        self.bdate = bdate
        self.books = books
        self.interests = interests
        self.home_town = home_town
    
    }
   */
    
}
