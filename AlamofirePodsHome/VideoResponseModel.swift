

import Foundation
import ObjectMapper

class VideoResponseModel: Mappable {
    
    
    var response : [VideoModel]?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        
        response <- map["response"]
    }
}
