

import Foundation
import ObjectMapper

class UserResponseModel: Mappable {

   
        var response : [UserModel]?
    
        required init?(_ map: Map){
            
        }
    
        func mapping(map: Map) {
            
            response <- map["response"]
        } 
    }

