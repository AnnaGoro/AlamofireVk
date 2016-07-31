//
//  VideoGetService.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 7/30/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import Alamofire

class VideoGetService {

    
    var url = "https://api.vk.com/method/METHOD_NAME?PARAMETERS&access_token=ACCESS_TOKEN"
    var mainUrlMethod = Url.mainUrl
    
    var methodNameVideoGet = "videos.get?"
    var methodNameGetUserVideos = "video.getUserVideos?"
    var methodNameGetSearchVideos = " video.search?"
   
    var amper = "&"
    var accessToken = Url.accessTocken + ""
    
    func getVideoById (owner_id : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNameVideoGet + owner_id + amper +  accessToken) )
             .responseArray { (response: Response<[VideoModel], NSError>) in
                
                let videoModelArray = response.result.value
                print(videoModelArray)
                
                
                
        }
    }
    func getVideoByIdCount (owner_id : String, count : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNameVideoGet + owner_id + amper + count +  accessToken) )
            .responseArray { (response: Response<[VideoModel], NSError>) in
                
                let videoModelArray = response.result.value
                print(videoModelArray)
                
                
                
        }
    }
    
    func getUserVideos (user_id  : String, count : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNameGetUserVideos + user_id + amper + count +  accessToken) )
           .responseArray { (response: Response<[VideoModel], NSError>) in
                
                let videoModelArray = response.result.value
                print(videoModelArray)
                
                
                
        }
    }
//search_own  -  1 - — искать по видеозаписям пользователя, 0 — не искать по видеозаписям пользователя. По умолчанию: 0. 
    
    
    func getSearchVideos (keyWord q : String, search_own : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNameGetSearchVideos + q  + amper + search_own +  accessToken) )
            .responseArray { (response: Response<[VideoModel], NSError>) in
                let videoModelArray = response.result.value
                print(videoModelArray)
                
                
                
        }
    }

    //longer
    
    
    func getSearchVideos (keyWord q : String, search_own : String, longer : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNameGetSearchVideos + q  + amper + search_own + amper + longer +  accessToken) )
           .responseArray { (response: Response<[VideoModel], NSError>) in
                
                let videoModelArray = response.result.value
                print(videoModelArray)
                
                
                
        }
    }
    
    
    
}

