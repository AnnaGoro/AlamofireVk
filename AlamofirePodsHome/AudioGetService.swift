//
//  AudioGetService.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 7/30/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class AudioGetService {

    //(callback: (ApiResponse, ApiError) -> void)
    
    
    var url = "https://api.vk.com/method/METHOD_NAME?PARAMETERS&access_token=ACCESS_TOKEN"
    var mainUrlMethod = Url.mainUrl
    var mNAudioGet = "audio.get?"
    var mNAudioGetAlbums = "audio.getAlbums?"
    var methodNameAudioGetPopular = "audio.getPopular?"
    var amper = "&"
    var accessToken = Url.accessTocken

    
    
    func getAudioAlbumsJSON(owner_id : String) {
        
        
        
        Alamofire.request(.GET,  mainUrlMethod + mNAudioGetAlbums, parameters: ["owner_id" : owner_id, "v" : "5,53", "access_token" : accessToken] ).validate()
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
    }

    
    func getAudiosFromAlbumJSON(owner_id : String, album_id : String) {
        
        
        
        Alamofire.request(.GET,  mainUrlMethod + mNAudioGet, parameters: ["owner_id" : owner_id, "album_id" : album_id, "v" : "5,53", "access_token" : accessToken] ).validate()
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
    }
    

    
    func getAudioAlbums(owner_id : String, completionHandler: (Bool, [AudioAlbumModel]) -> ()) {
        
        var myData: [AudioAlbumModel] = [AudioAlbumModel]()
        
        Alamofire.request(.GET, mainUrlMethod + mNAudioGetAlbums, parameters: ["owner_id" : owner_id, "v" : "5,53", "access_token" : accessToken] ).validate()
            .responseObject { (response: Response<AudioAlbumResponseModel, NSError>) in
                let audioAlbumResponseModel = response.result.value
                print("getAudio Albums before unwrapping")
                if let audioAlbumResponseModel = audioAlbumResponseModel {
                    if let audioAlbumListModel = audioAlbumResponseModel.response {
                        if let audioAlbumModel = audioAlbumResponseModel.response?.items {
                        myData = audioAlbumModel
                        completionHandler(true, myData)
                        print(" getAudioAlbums AudioGetService \(myData[1].owner_id)")
                    }
                }
                } }
    }

    
    func getAudiosFromAlbum(owner_id : String, album_id : String, completionHandler: (Bool, [AudioModel]) -> ()) {
        
        var myData: [AudioModel] = [AudioModel]()
        
        Alamofire.request(.GET, mainUrlMethod + mNAudioGet, parameters: ["owner_id" : owner_id, "album_id" : album_id, "v" : "5.53",  "access_token" : accessToken] ).validate()
            .responseObject { (response: Response<AudioResponseModel, NSError>) in
                let audioResponseModel = response.result.value
                print("getAlbums before unwrapping")
                if let audioResponseModel = audioResponseModel {
                    if let audioModel = audioResponseModel.response {
                        myData = audioModel
                        completionHandler(true, (myData))
                        //print(" getAlbums PhotoGetService \(myData[1].owner_id)")
                    }
                }
        }
    }
    
    
    func getAllAudiosFromUser(owner_id : String, completionHandler: (Bool, [AudioModel]) -> ()) {
        
        var myData: [AudioModel] = [AudioModel]()
        
        Alamofire.request(.GET, mainUrlMethod + mNAudioGet, parameters: ["owner_id" : owner_id,  "v" : "5.53",  "access_token" : accessToken] ).validate()
            .responseObject { (response: Response<AudioResponseModel, NSError>) in
                let audioResponseModel = response.result.value
                print("getAlbums before unwrapping")
                if let audioResponseModel = audioResponseModel {
                    if let audioModel = audioResponseModel.response {
                        myData = audioModel
                        completionHandler(true, myData)
                        //print(" getAlbums PhotoGetService \(myData[1].owner_id)")
                    }
                }
        }
    }
    
    
    func getAudioByIdJSON() {
        
        _ = "https://api.vk.com/method/users.get?"
        
        
        Alamofire.request(.GET,  (mainUrlMethod + methodNameAudioGetPopular + only_eng + amper + accessToken) ).validate()
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
    }
    

    
    /*
    func getAudioById1 (owner_id : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNameAudioGet + owner_id + accessToken) )
            .responseObject { (response: Response<AudioResponseModel, NSError>) in
                let audioResponseModel = response.result.value
                if let audioResponseModel = audioResponseModel {
                    if let audioModel = audioResponseModel.response {
                        
                        for value in audioModel {
                            print (value.title)
                            
                        }
                    }
                }
        }
    }
    */

//1 - eng, 0 - all
    // count - count of returned audios
    var only_eng = "only_eng=1"
    func getPopularAudioCount (completionHandler: (Bool, [AudioModel]) -> ()) {
        var audioArray: [AudioModel] = [AudioModel]()
        
        Alamofire.request(.GET, (mainUrlMethod + methodNameAudioGetPopular + only_eng + amper + accessToken) ).validate()
            .responseObject { (response: Response<AudioResponseModel, NSError>) in
                let audioResponseModel = response.result.value
                if let audioResponseModel = audioResponseModel {
                   
                    if let audioModel = audioResponseModel.response {
                         audioArray = audioModel
                         completionHandler(true, (audioArray))
                    }
                }
        }
    }

    func getPopularAudio (only_eng : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNameAudioGetPopular + only_eng + amper + accessToken) )
            .responseObject { (response: Response<AudioResponseModel, NSError>) in
                let audioResponseModel = response.result.value
                if let audioResponseModel = audioResponseModel {
                    if let audioModel = audioResponseModel.response {
                        
                        for value in audioModel {
                            print (value)
                            
                        }
                    }
                }
        }
    }
}