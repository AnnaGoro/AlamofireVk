

import Foundation
import ObjectMapper

class AudioAlbumResponseModel : Mappable {
    
    
     var response  : AudioAlbumListResponseModel?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        
        
        response <- map["response"]
       
        
    }
}