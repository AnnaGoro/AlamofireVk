

import Foundation
import ObjectMapper

class AudioResponseModel: Mappable {
    
    var response  : AudioListResponseModel?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        
        
        response <- map["response"]
        
        
    }
}
