//
//  urlsEn.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 7/31/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation

class Url {
    
  static var accessTocken: String = NSUserDefaults.standardUserDefaults().stringForKey("access_token")!
    
    
    static var userId: String = NSUserDefaults.standardUserDefaults().stringForKey("user_id")!
   //https://oauth.vk.com/blank.html#access_token=33c7e22847909eb297011721c0dd8adfd122870e8d25ffe6fddca80872c2d705e1b5463adc5bb9c231bb3&expires_in=86400&user_id=29338816
    
  static var mainUrl = "https://api.vk.com/method/"
    
   // static var accessTocken: String =  "33c7e22847909eb297011721c0dd8adfd122870e8d25ffe6fddca80872c2d705e1b5463adc5bb9c231bb3"

}