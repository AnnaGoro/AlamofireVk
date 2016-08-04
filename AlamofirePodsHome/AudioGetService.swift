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
    
    var methodNameAudioGet = "audios.get?"
    var methodNameAudioGetPopular = "audio.getPopular?"
    var amper = "&"
    var accessToken = Url.accessTocken

    
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