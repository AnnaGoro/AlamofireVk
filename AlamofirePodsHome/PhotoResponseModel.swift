

import Foundation
import ObjectMapper

class PhotoResponseModel: Mappable {
    
    
    var response : [PhotoModel]?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        
        response <- map["response"]
    }
}
