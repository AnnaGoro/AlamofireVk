//
//  UserGetService.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 7/30/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper
class UserGetService {
    
    // https://api.vk.com/method/users.get?user_ids=210700286&fields=bdate&v=5.53
    
    var url = "https://api.vk.com/method/METHOD_NAME?PARAMETERS&access_token=ACCESS_TOKEN"
    var mainUrlMethod = Url.mainUrl
    
    var methodName = "users.get?"
    var methodNameFriends = "friends.get??"
    var amper = "&"
    var accessToken = Url.accessTocken
    var array: [UserModel] = []
    var user_ids = Url.userId
    
    //var parameterUserId = "user_ids=210700286"
    //var parameterShowField = "fields=bdate"
    
    
    func getFriendsJSON () {
       // var myData: [UserModel] = [UserModel]()
        
        Alamofire.request(.GET, mainUrlMethod + methodNameFriends, parameters: ["user_ids" : user_ids, "order" : "hints", "fields" : "photo_50, bdate, photo_200_orig", "access_token" : accessToken] ).validate()
             .responseJSON{ response in
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }

    
    }
    
    func getFriends (completionHandler: (Bool, [UserModel]) -> ()) {
        
        var myData: [UserModel] = [UserModel]()
        
        Alamofire.request(.GET, mainUrlMethod + methodNameFriends, parameters: ["user_ids" : user_ids, "order" : "hints", "fields" : "photo_50, bdate, photo_200_orig", "access_token" : accessToken] ).validate()
            .responseObject { (response: Response<UserResponseModel, NSError>) in
                let userResponseModel = response.result.value
                print("getUserFriends before unwrapping")
                if let userResponseModel = userResponseModel {
                    if let userModel = userResponseModel.response {
                        myData = userModel
                        completionHandler(true, (myData))
                        print(myData[0].first_name)
                    }
                }
        }
    }
    
    
    
    
    
    func getUserByIdJSON() {
        
        let url = "https://api.vk.com/method/users.get?"
        
        
        Alamofire.request(.GET, url, parameters: ["user_ids" : "210700286", "fields" : "bdate", "v":"5.53"] )
            .responseJSON { response in
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
    }
    
    
    
    
    func getUserById1(completionHandler: (Bool, [UserModel]) -> ()) {
        
        var myData: [UserModel] = [UserModel]()
        
         let url = "https://api.vk.com/method/users.get?"
       // let url = "https://api.vk.com/method/users.get?user_ids=210700286&fields=bdate&v=5.53"
        Alamofire.request(.GET, url, parameters: ["user_ids" : "210700286, 210704486, 210560286, 210700226, 210715686, 210615686, 229315686, 210415686, 210712286, 210715685, 210715684, 210715683", "fields" : "bdate, photo_50", "v":"5.53", "access_token":accessToken] ).validate()
        //Alamofire.request(.GET, url).validate()
            .responseObject { (response: Response<UserResponseModel, NSError>) in
                let userResponseModel = response.result.value
                print("getUserById1 before unwrapping")
                if let userResponseModel = userResponseModel {
                    if let userModel = userResponseModel.response {
                        myData = userModel
                        completionHandler(true, (myData))
                        
                        
                        //callback(Result.Success(userModel))
                        
                      /*  for value in userModel {
                            print("getUserById1 ")
                            print (value)
                            print (value.first_name)
                             print (value.last_name)
                             print(value.id)
 
                        }
 */
                    }
                }
        } 
             }
    
    func getUserById(parameterUserId : String) {
        
        Alamofire.request(.GET, mainUrlMethod + methodName + parameterUserId + amper  + accessToken)
            .responseObject { (response: Response<UserResponseModel, NSError>) in
                let userResponseModel = response.result.value
                if let userResponseModel = userResponseModel {
                    if let userModel = userResponseModel.response {
                        
                        for value in userModel {
                            print("getUserById1 ")
                            print (value)
                            
                        }
                    }
                }
        }
    }
    
    func getUserById(parameterUserId : String, parameterShowField1 : String,  parameterShowField2 : String) {
        
        Alamofire.request(.GET, (mainUrlMethod + methodName + parameterUserId + amper + parameterShowField1 + parameterShowField2 + accessToken) )
            .responseObject { (response: Response<UserResponseModel, NSError>) in
                let userResponseModel = response.result.value
                if let userResponseModel = userResponseModel {
                    if let userModel = userResponseModel.response {
                        
                        for value in userModel {
                            print("getUserById1 ")
                            print (value)
                            
                        }
                    }
                }
        }
    }
    
    
    
    func getUserById(parameterUserId : String, parameterShowField1 : String,  parameterShowField2 : String,  parameterShowField3 : String) {
        
        Alamofire.request(.GET, (mainUrlMethod + methodName + parameterUserId + amper + parameterShowField1 + parameterShowField2 + parameterShowField3 + accessToken) )
            .responseObject { (response: Response<UserResponseModel, NSError>) in
                let userResponseModel = response.result.value
                if let userResponseModel = userResponseModel {
                    if let userModel = userResponseModel.response {
                        
                        for value in userModel {
                            print (value)
                            
                        }
                    }
                }
        }
    }
    
    func getUserById(parameterUserId : String, parameterShowField1 : String,  parameterShowField2 : String,  parameterShowField3 : String, parameterShowField4 : String) {
        
        Alamofire.request(.GET, (mainUrlMethod + methodName + parameterUserId + amper + parameterShowField1 + parameterShowField2 + parameterShowField3 + parameterShowField4 + accessToken) )
            .responseObject { (response: Response<UserResponseModel, NSError>) in
                let userResponseModel = response.result.value
                if let userResponseModel = userResponseModel {
                    if let userModel = userResponseModel.response {
                        
                        for value in userModel {
                            print (value)
                            
                        }
                    }
                }
        }
    }
}











