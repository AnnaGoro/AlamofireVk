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
    var methodNameAlbums = "photos.getAlbums?"
    
    
    func getAlbumsJSON (owner_id : String) {
        // var myData: [UserModel] = [UserModel]()
        
        Alamofire.request(.GET, mainUrlMethod + methodNameAlbums, parameters: ["owner_id" : owner_id, "need_covers" : "1",  "access_token" : accessToken]).validate()
            .responseJSON{ response in
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
        
        
    }

    func getPhotosJSON (owner_id : String, album_id : String) {
        // var myData: [UserModel] = [UserModel]()
        
        Alamofire.request(.GET, mainUrlMethod + methodNamePhotosGet, parameters: ["owner_id" : owner_id, "album_id" : album_id,  "access_token" : accessToken]).validate()
            .responseJSON{ response in
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
        
        
    }

    
    func getAlbums(owner_id : String, completionHandler: (Bool, [AlbumModel]) -> ()) {
        
        var myData: [AlbumModel] = [AlbumModel]()
        
        Alamofire.request(.GET, mainUrlMethod + methodNameAlbums, parameters: ["owner_id" : owner_id, "need_covers" : "1",  "access_token" : accessToken] ).validate()
            .responseObject { (response: Response<AlbumResponseModel, NSError>) in
                let albumResponseModel = response.result.value
                print("getAlbums before unwrapping")
                if let albumResponseModel = albumResponseModel {
                    if let albumModel = albumResponseModel.response {
                        myData = albumModel
                        completionHandler(true, (myData))
                        print(" getAlbums PhotoGetService \(myData[0].owner_id)")
                    }
                }
        }
    }

    func getPhotos(owner_id : String, album_id : String, completionHandler: (Bool, [PhotoModel]) -> ()) {
        
        var myData: [PhotoModel] = [PhotoModel]()
        
        Alamofire.request(.GET, mainUrlMethod + methodNamePhotosGet, parameters: ["owner_id" : owner_id, "album_id" : album_id,  "access_token" : accessToken] ).validate()
            .responseObject { (response: Response<PhotoResponseModel, NSError>) in
                let photoResponseModel = response.result.value
                print("getPhotos before unwrapping")
                if let photoResponseModel = photoResponseModel {
                    if let photoModel = photoResponseModel.response {
                        myData = photoModel
                        completionHandler(true, (myData))
                        print(myData[0].owner_id)
                    }
                }
        }
    }

    func getPhotoById1 () {
        Alamofire.request(.GET, (mainUrlMethod + methodNamePhotosGet + owner_id +  accessToken) )
            .responseObject { (response: Response<PhotoResponseModel, NSError>) in
                let photoResponseModel = response.result.value
                if let photoResponseModel = photoResponseModel {
                    if let photoModel = photoResponseModel.response {
                        
                        for value in photoModel {
                            print (value)
                            
                        }
                    }
                }
        }
    }
    
    func getSavedPhotoById (owner_id : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNamePhotosGet + owner_id + amper + album_id +  accessToken) )
            .responseObject { (response: Response<PhotoResponseModel, NSError>) in
                let photoResponseModel = response.result.value
                if let photoResponseModel = photoResponseModel {
                    if let photoModel = photoResponseModel.response {
                        
                        for value in photoModel {
                            print (value)
                            
                        }
                    }
                }
        }
    }

    //q - definition
    
    func getSearchPhotoKeyWord (keyWord q : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNamePhotosSearch + q  + amper +  accessToken) )
            .responseObject { (response: Response<PhotoResponseModel, NSError>) in
                let photoResponseModel = response.result.value
                if let photoResponseModel = photoResponseModel {
                    if let photoModel = photoResponseModel.response {
                        
                        for value in photoModel {
                            print (value)
                            
                        }
                    }
                }
        }
    }
    func getSearchPhotoKeyWord (keyWord q : String, count : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNamePhotosSearch + q  + amper + count +  accessToken) )
            .responseObject { (response: Response<PhotoResponseModel, NSError>) in
                let photoResponseModel = response.result.value
                if let photoResponseModel = photoResponseModel {
                    if let photoModel = photoResponseModel.response {
                        
                        for value in photoModel {
                            print (value)
                            
                        }
                    }
                }
        }
    }

    //lat - -90 to 90
    //long - -180 to 180
    
    func getSearchPhotoLatLong (lat lat : String, long : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNamePhotosSearch + lat  + amper + long +  accessToken) )
            .responseObject { (response: Response<PhotoResponseModel, NSError>) in
                let photoResponseModel = response.result.value
                if let photoResponseModel = photoResponseModel {
                    if let photoModel = photoResponseModel.response {
                        
                        for value in photoModel {
                            print (value)
                            
                        }
                    }
                }
        }
    }

}