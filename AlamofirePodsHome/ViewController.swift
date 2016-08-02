//
//  ViewController.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 7/28/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import UIKit
import VK_ios_sdk
class ViewController : UIViewController {
    
@IBOutlet weak var authWebView: UIWebView!
     var webViewController = WebViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if let access_token = defaults.stringForKey("access_token") {
            print(access_token)
        } else {            
            if let url = NSURL(string: Authorization.REQUEST_STR) {
                
                let request = NSURLRequest(URL: url)
                authWebView.loadRequest(request)
                webViewController.webViewDidStartLoad(authWebView)
                
            }

            
        }
            
        
    }
    

    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}