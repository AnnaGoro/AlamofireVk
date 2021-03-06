//
//  AuthorizationService.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 7/30/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation

class Authorization {

    static let secureKey = "0YFFOirBPmeynCFQGG2W"
    static let applicationVkId = 5570019
    
    //var pattern = Pattern.compile("https?://(api|oauth)\\.vk\\.com/blank\\.html.*");

//https://oauth.vk.com/authorize?client_id=1&display=page&redirect_uri=http://example.com/callback&scope=friends&response_type=token&v=5.53&state=123456   
    
    static let AUTH_URI = "https://oauth.vk.com/authorize?"
    
    static let PARAM_CLIENT_ID = "client_id=5570019";
    
    static let SCOPE = "scope=notify,friends,photos,audio,video,docs,notes,pages,offers,questions,wall,group,messages,offline";
    
    static let REDIRECT_URI = "redirect_uri=http://oauth.vk.com/blank.html";
    
    static let DISPLAY = "display=touch";
    
    static let  RESPONSE_TYPE = "response_type=token";
    
    static let  VERSION = "v=5.37";
    
    static let REQUEST_STR = AUTH_URI + PARAM_CLIENT_ID + "&"
    + SCOPE + "&" + REDIRECT_URI + "&" + DISPLAY + "&" + RESPONSE_TYPE + "&" + VERSION;



}