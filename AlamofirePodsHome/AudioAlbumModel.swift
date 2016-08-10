

import Foundation
import ObjectMapper

class AudioAlbumModel : Mappable {

    var album_id : Int?
    var title : String?
    var owner_id : Int?
    
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
    
    album_id <- map["album_id"]
    title <- map["title"]
    owner_id <- map["owner_id"]
    
    }
    
}