//
//  urlsEn.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 7/31/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation

class Url {
    
    static var accessTocken = NSUserDefaults.standardUserDefaults().stringForKey("access_token") ?? ""
    static var userId: String = NSUserDefaults.standardUserDefaults().stringForKey("user_id") ?? ""
    
    static var mainUrl = "https://api.vk.com/method/"
   

}