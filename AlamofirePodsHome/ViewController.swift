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

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var userGetService = UserGetService()
        var audioGetService = AudioGetService()
        
        var photoGetService = PhotoGetService()
        print("Trololo")
        userGetService.getUserById1()
      //  audioGetService.getPopularAudioCount("only_eng=1", count: "count=10");
        //photoGetService.getPhotoById1()
       // userGetService.getUserByIdJSON()
        userGetService.getUserByIdJSONFullUrlTest()
       // print("Trololo2")
       // let bundleIdentifier = NSBundle.mainBundle().bundleIdentifier
        //print("Bundle :")
       // print(bundleIdentifier)
        
        print("**********************")
        //print ("id: ")
        //let bundle = NSBundle.mainBundle().infoDictionary?["CFBundleIdentifier"] as? NSString
        
        
       // var fuckingTest = FuckingTest()
       // fuckingTest.ffffffu()
       // print (bundle)
       // print("**********************")
    }
    

    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}