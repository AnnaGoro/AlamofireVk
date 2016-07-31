//
//  UserGetService.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 7/30/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import AlamofireJsonToObjects

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
    
    func getUserById1 (parameterUserId : String, parameterShowField : String) {
        Alamofire.request(.GET, (mainUrlMethod + methodName + parameterUserId + amper + parameterShowField + accessToken) )
            .responseObject { (response: Response<UserModel, NSError>) in
            
            let userModel = response.result.value
            print(userModel)
            
            
            
        }
}
    func getUserById(parameterUserId : String) {
        
        Alamofire.request(.GET, (mainUrlMethod + methodName + parameterUserId + amper  + accessToken) )
            .responseObject { (response: Response<UserModel, NSError>) in
                
                let userModel = response.result.value
                print(userModel)
                
                
                
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
            .responseObject { (response: Response<UserModel, NSError>) in
                
                let userModel = response.result.value
                print(userModel)
                
                
                
        }
        
    }
}











