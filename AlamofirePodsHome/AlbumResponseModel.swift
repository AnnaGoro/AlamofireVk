

import Foundation
import ObjectMapper

class AlbumResponseModel: Mappable {
    
    
    var response : [AlbumModel]?
    var count : Int?
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        
        response <- map["response"]
        count <- map ["count"]
    }
}

