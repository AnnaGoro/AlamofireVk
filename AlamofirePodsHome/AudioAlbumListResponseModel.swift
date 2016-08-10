

import Foundation
import ObjectMapper

class AudioAlbumListResponseModel : Mappable {

    var count : Int?
    var items : [AudioAlbumModel]?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        
        count <- map["count"]
        items <- map["items"]
        
        
    }




}