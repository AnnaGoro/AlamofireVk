

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper

class VideoGetService {

    
    var url = "https://api.vk.com/method/METHOD_NAME?PARAMETERS&access_token=ACCESS_TOKEN"
    var mainUrlMethod = Url.mainUrl
    
    var methodNameVideoGet = "videos.get?"
    var methodNameGetUserVideos = "video.getUserVideos?"
    var methodNameGetSearchVideos = " video.search?"
   
    var amper = "&"
    var accessToken = Url.accessTocken
    
    func getVideoById (owner_id : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNameVideoGet + owner_id + amper +  accessToken) )
            .responseObject { (response: Response<VideoResponseModel, NSError>) in
                let videoResponseModel = response.result.value
                if let videoResponseModel = videoResponseModel {
                    if let videoModel = videoResponseModel.response {
                        
                        for value in videoModel {
                            print (value)
                            
                        }
                    }
                }
        }
    }
    func getVideoByIdCount (owner_id : String, count : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNameVideoGet + owner_id + amper + count +  accessToken) )
            .responseObject { (response: Response<VideoResponseModel, NSError>) in
                let videoResponseModel = response.result.value
                if let videoResponseModel = videoResponseModel {
                    if let videoModel = videoResponseModel.response {
                        
                        for value in videoModel {
                            print (value)
                            
                        }
                    }
                }
        }
    }
    func getUserVideos (user_id  : String, count : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNameGetUserVideos + user_id + amper + count +  accessToken) )
            .responseObject { (response: Response<VideoResponseModel, NSError>) in
                let videoResponseModel = response.result.value
                if let videoResponseModel = videoResponseModel {
                    if let videoModel = videoResponseModel.response {
                        
                        for value in videoModel {
                            print (value)
                            
                        }
                    }
                }
        }
    }
//search_own  -  1 - — искать по видеозаписям пользователя, 0 — не искать по видеозаписям пользователя. По умолчанию: 0. 
    
    
    func getSearchVideos (keyWord q : String, search_own : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNameGetSearchVideos + q  + amper + search_own +  accessToken) )
            .responseObject { (response: Response<VideoResponseModel, NSError>) in
                let videoResponseModel = response.result.value
                if let videoResponseModel = videoResponseModel {
                    if let videoModel = videoResponseModel.response {
                        
                        for value in videoModel {
                            print (value)
                            
                        }
                    }
                }
        }
    }

    //longer
    
    
    func getSearchVideos (keyWord q : String, search_own : String, longer : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodNameGetSearchVideos + q  + amper + search_own + amper + longer +  accessToken) )
            .responseObject { (response: Response<VideoResponseModel, NSError>) in
                let videoResponseModel = response.result.value
                if let videoResponseModel = videoResponseModel {
                    if let videoModel = videoResponseModel.response {
                        
                        for value in videoModel {
                            print (value)
                            
                        }
                    }
                }
        }
    }
    
    
}

