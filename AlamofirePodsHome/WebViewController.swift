//
//  WebViewController.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 8/1/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import UIKit

class WebViewController:UIWebView, UIWebViewDelegate {

    
    func webViewDidStartLoad(webView: UIWebView) {
        //создадим хеш-таблицу для хранения данных
        var user: [String : String] = [String : String]()
        //смотрим на адрес открытой станицы
        var currentURL: String = webView.request!.URL!.absoluteString
        var textRange = currentURL.lowercaseString.rangeOfString("access_token".lowercaseString)
        //смотрим, содержится ли в адресе информация о токене
        if textRange != nil {
            //Ура, содержится, вытягиваем ее
            var data: [String] = currentURL.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: "=&"))
            user["access_token"] = data[1]
            user["expires_in"] = data[3]
            user["user_id"] = data[5]
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(user["access_token"], forKey: "access_token")
            defaults.setObject(user["user_id"], forKey: "user_id")
            defaults.setObject(user["expires_in"], forKey: "expires_in")
            
            //NSUserDefaults.setValue(user["access_token"], forKey: "access_token")
            //NSUserDefaults.setValue(user["user_id"], forKey: "user_id")
            //NSUserDefaults.setValue(user["expires_in"], forKey: "expires_in")
        }
}
}