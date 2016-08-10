

import Foundation
import ObjectMapper

class UserModel: Mappable {

    var id: Int?
    var first_name: String?
    var last_name: String?
    var photo_50 : String? // url
    
    //  deleted или banned if returns
    
    var deactivated : String?
   
    /*  возвращается 1 при вызове без access_token, если пользователь установил настройку «Кому в интернете видна моя страница» — «Только пользователям ВКонтакте». */
    
    var hidden : Int?
    
    
    //  DD.MM.YYYY или DD.MM (если год рождения скрыт). Если дата рождения скрыта целиком, поле отсутствует в ответе.
    
    var bdate: String?
    var books : String?
    var interests : String?
    var home_town : String?
    
    var photo_200_orig : String?
    var user_id : Int?
     
    
    
    required init?(_ map: Map){
       
    }
    

    
    func mapping(map: Map) {
         id <- map["id"]
         first_name <- map["first_name"]
         last_name <- map["last_name"]
         photo_50 <- map["photo_50"]
         deactivated <- map["deactivated"]
         hidden <- (map["hidden"])
         bdate <- map["bdate"]
         books <- map["books"]
         interests <- map["interests"]
         home_town <- map["home_town"]
         photo_200_orig <- map["photo_200_orig"]
         user_id <- map["user_id"]
    }
    
       
}
