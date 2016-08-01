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
    var amper = "&"
    var accessToken = Url.accessTocken + ""
    
  //  var urlTrololo : String {
   //     return  mainUrlMethod + methodName + parameterUserId + amper + //parameterBdate + accessToken
  //  }
    
    // var parameterUserId = "user_ids=210700286"
    //var parameterShowField = "fields=bdate"
    /*
    func getUserById (parameterUserId : String, parameterShowField : String) {
     
    Alamofire.request(.GET, (mainUrlMethod + methodName + parameterUserId + amper + parameterShowField + accessToken) )
    .responseJSON { response in
    print(response.request)  // original URL request
    print(response.response) // URL response
    print(response.data)     // server data
    print(response.result)   // result of response serialization
    
    if let JSON = response.result.value {
    print("JSON: \(JSON)")
        }
    }
    }
    
    */
    
    //var parameterUserId = "user_ids=210700286"
    //var parameterShowField = "fields=bdate"
    
    
    func getUserByIdJSON() {
        
        let url = "https://api.vk.com/method/users.get?"
        
        
        Alamofire.request(.GET, url, parameters: ["user_ids" : "210700286", "fields" : "bdate", "v":"5.53"] )
            .responseJSON { response in
                // print(response.request)  // original URL request
                //print(response.response) // URL response
                // print(response.data)     // server data
                // print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
    }

    
    
    func getUserByIdJSONFullUrlTest() {
      
        let url = "https://api.vk.com/method/users.get?user_ids=210700286&fields=bdate&v=5.53"
        
        
        Alamofire.request(.GET, url)
            .responseJSON { response in
               // print(response.request)  // original URL request
                //print(response.response) // URL response
               // print(response.data)     // server data
               // print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON  full url without params: \(JSON)")
                }
        }
    }
    
   
    func getUserById1() {
       // let example url = "https://api.vk.com/method/users.get?user_ids=210700286&fields=bdate&v=5.53"
        let url = "https://api.vk.com/method/users.get?"
        
        
        Alamofire.request(.GET, url, parameters: ["user_ids" : "210700286", "fields" : "bdate", "v":"5.53"] )
            .responseArray { (response: Response<[UserModel], NSError>) in
              
                if let userModel = response.result.value {
                print("getUserById1 ")
                    print (userModel[0].bdate)
                    print (userModel[0].first_name)
                    print (userModel[0].last_name)
                    print(userModel[0].id)
                }
            
            
        }
}
    
    
    func getUserById(parameterUserId : String) {
        
        Alamofire.request(.GET, mainUrlMethod + methodName + parameterUserId + amper  + accessToken)
            .responseObject { (response: Response<UserModel, NSError>) in                
                if let userModel = response.result.value {
                print(userModel)
                
                }
                
        }
        
        
    }
    
    func getUserById(parameterUserId : String, parameterShowField1 : String,  parameterShowField2 : String) {
        
        Alamofire.request(.GET, (mainUrlMethod + methodName + parameterUserId + amper + parameterShowField1 + parameterShowField2 + accessToken) )
            .responseObject { (response: Response<UserModel, NSError>) in
                
                let userModel = response.result.value
                print(userModel)
                
                
                
        }
        
        
    }
    
    
    
    func getUserById(parameterUserId : String, parameterShowField1 : String,  parameterShowField2 : String,  parameterShowField3 : String) {
    
        Alamofire.request(.GET, (mainUrlMethod + methodName + parameterUserId + amper + parameterShowField1 + parameterShowField2 + parameterShowField3 + accessToken) )
            .responseObject { (response: Response<UserModel, NSError>) in
                
                let userModel = response.result.value
                print(userModel)
                
                
                
        }
    
    }
    
    func getUserById(parameterUserId : String, parameterShowField1 : String,  parameterShowField2 : String,  parameterShowField3 : String, parameterShowField4 : String) {
        
        Alamofire.request(.GET, (mainUrlMethod + methodName + parameterUserId + amper + parameterShowField1 + parameterShowField2 + parameterShowField3 + parameterShowField4 + accessToken) )
            .responseObject{(response: Response<UserModel, NSError>) in
                let userModel = response.result.value
                print(userModel)
                
                
                
        }
        
    }
}











