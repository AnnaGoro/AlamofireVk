//
//  ViewController.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 7/28/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import UIKit
import VK_ios_sdk
class ViewController : UIViewController, UIWebViewDelegate{
    
   // @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var authWebView: UIWebView!
    var webViewController = WebViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         //okBtn.enabled = false
         authWebView.delegate = self
        
      //  let defaults = NSUserDefaults.standardUserDefaults()
       
        
        let myURL = NSURL(string: Authorization.REQUEST_STR);
        let myURLRequest:NSURLRequest = NSURLRequest(URL: myURL!);
    
        
        
        if NSUserDefaults.standardUserDefaults().stringForKey("access_token") == "" {
                authWebView.loadRequest(myURLRequest)
                print ("load request")
               // okBtn.enabled = true
        } else {
        
             self.shouldPerformSegueWithIdentifier("showFriends", sender: self)
                print ("showFriends")
               // okBtn.enabled = true
            
            
            
        }
        
            
        }
            
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
   
    func webViewDidFinishLoad(authWebView: UIWebView) {
        
        print ("webViewDidFinishLoad")
        
        //создадим хеш-таблицу для хранения данных
        var user: [String : String] = [String : String]()
        //смотрим на адрес открытой станицы
        let currentURL : String = (authWebView.request?.URL!.absoluteString)!
        // var currentURL = webView.request!.URL!.absoluteString;
        var textRange = currentURL.lowercaseString.rangeOfString("access_token".lowercaseString)
        //смотрим, содержится ли в адресе информация о токене
        if textRange != nil {
            //Ура, содержится, вытягиваем ее
            var data: [String] = currentURL.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: "=&"))
            user["access_token"] = data[1]
            user["expires_in"] = data[3]
            user["user_id"] = data[5]
        
            
            NSUserDefaults.standardUserDefaults().setObject(user["access_token"], forKey: "access_token")
            print( NSUserDefaults.standardUserDefaults().stringForKey("access_token"))
            
            NSUserDefaults.standardUserDefaults().setObject(user["user_id"], forKey: "user_id")
            
            print ( NSUserDefaults.standardUserDefaults().stringForKey("user_id"))
            
            NSUserDefaults.standardUserDefaults().setObject(user["expires_in"], forKey: "expires_in")
            
            print(NSUserDefaults.standardUserDefaults().stringForKey("expires_in"))
            
           
                   }
    }

}