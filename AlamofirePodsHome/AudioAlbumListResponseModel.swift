//
//  AudioAlbumListResponseModel.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 8/10/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

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