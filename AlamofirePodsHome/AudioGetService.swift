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
    var accessToken = Url.accessTocken + ""

    
    
    func getAudioById1 (owner_id : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNameAudioGet + owner_id +  accessToken) )
            .responseArray { (response: Response<[AudioModel], NSError>) in
                
                let audioModelArray = response.result.value
               
                print(audioModelArray)
                
                
                
        }
    }
//1 - eng, 0 - all
    // count - count of returned audios
    
    func getPopularAudioCount (only_eng : String, count : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNameAudioGetPopular + only_eng + amper + count +  accessToken) )
           .responseArray { (response: Response<[AudioModel], NSError>) in
                
                //let audioModelArray = response.result.value
            if let audioModelArray = response.result.value {
            for value in audioModelArray {
                print("\(value.artist) + method")
                 print("\(value.duration) + method")
                 print(value.genre_id)
                 print(value.owner_id)
                 print(value.title)
                 print(value.url)
            }
            }
        }
       // return audioModelArray
    
}

    func getPopularAudio (only_eng : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNameAudioGetPopular + only_eng + amper + accessToken) )
            .responseArray { (response: Response<[AudioModel], NSError>) in
                
                let audioModelArray = response.result.value
                print(audioModelArray)
                
                
                
        }
    }
}