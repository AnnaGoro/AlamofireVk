
import Foundation
import ObjectMapper

class AudioListResponseModel : Mappable {

    var count : Int?
    var items : [AudioModel]?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        
        count <- map["count"]
        items <- map["items"]
        
        
    }






}
