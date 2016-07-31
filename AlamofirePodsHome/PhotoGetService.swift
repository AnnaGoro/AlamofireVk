//
//  PhotoGetService.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 7/30/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import Alamofire

class PhotoGetService {
    
    var url = "https://api.vk.com/method/METHOD_NAME?PARAMETERS&access_token=ACCESS_TOKEN"
    var mainUrlMethod = Url.mainUrl
    
    var methodNamePhotosGet = "photos.get?"
    var methodNamePhotosSearch = "photos.search?"
    var amper = "&"
    var accessToken = Url.accessTocken
    var album_id = "album_id=saved"
    var owner_id = "owner_id=@gorobchenko_anna"
    
    func getPhotoById1 () {
        Alamofire.request(.GET, (mainUrlMethod + methodNamePhotosGet + owner_id +  accessToken) )
            .responseArray { (response: Response<[PhotoModel], NSError>) in
                
                let photoModelArray = response.result.value
                print(photoModelArray)
                
                
                
        }
    }
    
    func getSavedPhotoById (owner_id : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNamePhotosGet + owner_id + amper + album_id +  accessToken) )
            .responseArray { (response: Response<[PhotoModel], NSError>) in
                
                let photoModelArray = response.result.value
                print(photoModelArray)
                
                
                
        }
    }

    //q - definition
    
    func getSearchPhotoKeyWord (keyWord q : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNamePhotosSearch + q  + amper +  accessToken) )
           .responseArray { (response: Response<[PhotoModel], NSError>) in
                let photoModelArray = response.result.value
                print(photoModelArray)
                
                
                
        }
    }

    func getSearchPhotoKeyWord (keyWord q : String, count : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNamePhotosSearch + q  + amper + count +  accessToken) )
            .responseArray { (response: Response<[PhotoModel], NSError>) in
                
                let photoModelArray = response.result.value
                print(photoModelArray)
                
                
                
        }
    }

    //lat - -90 to 90
    //long - -180 to 180
    
    func getSearchPhotoLatLong (lat lat : String, long long : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNamePhotosSearch + lat  + amper + long +  accessToken) )
           .responseArray { (response: Response<[PhotoModel], NSError>) in
                
                let photoModelArray = response.result.value
                print(photoModelArray)
                
                
                
        }
    }
    


}