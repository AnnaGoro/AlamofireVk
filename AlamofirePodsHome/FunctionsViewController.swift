//
//  FunctionsViewController.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 8/2/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import UIKit
import ImageLoader

class FunctionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet weak var goToHorizontalCV: UIButton!
    @IBOutlet weak var tableData: UITableView!
    
    
    //let array = ["1", "02", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13"]
    var arrayFirstNames: [String] = [String] ()
    
    var arrayLastNames: [String] = [String] ()
    
    var arrayUrlsPhoto: [String] = [String] ()
    
     var arrayBdates: [String] = [String] ()
    
    var audioGetService = AudioGetService()
    var userGetService = UserGetService()
    
    var userModelArray : [UserModel] = [UserModel] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        audioGetService.getAudioByIdJSON()
        
        
        
        
        userGetService.getUserById1() { (data) in
            var userModelArray = data.1
            for value in userModelArray {
            
            self.arrayFirstNames.append(value.first_name!)
            self.arrayLastNames.append(value.last_name!)
            var theAnswer = value.bdate ?? "no bDate"
            self.arrayBdates.append(theAnswer)
            self.arrayUrlsPhoto.append(value.photo_50!)
                
                
            }
            
            self.tableData.reloadData()
            
            print ("get user by id \(data.1[0].toJSONString())   \(data.0)")
            print ("get user from array \(userModelArray[0].first_name)   \(data.0)")
         
        }
        
       
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return arrayFirstNames.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let cellId = "Cell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! CustomCellUser
        
        cell.firstNameLabel?.text = arrayFirstNames[indexPath.row]
        cell.lastNameLabel?.text = arrayLastNames[indexPath.row]
        cell.bDateLabel?.text = arrayBdates[indexPath.row]
           
         let URL = arrayUrlsPhoto[indexPath.row]
         let placeholder = UIImage(named: "img_nature")!
         cell.thumbNailImageView.load(URL, placeholder: placeholder) { URL, image, error, cacheType in
         print("URL \(URL)")
         print("error \(error)")
         print("image \(image?.size), render-image \(cell.thumbNailImageView.image?.size)")
         print("cacheType \(cacheType.hashValue)")
         if cacheType == CacheType.None {
         let transition = CATransition()
         transition.duration = 0.5
         transition.type = kCATransitionFade
         cell.thumbNailImageView.layer.addAnimation(transition, forKey: nil)
         cell.thumbNailImageView.image = image
        
            
         }
            
            cell.thumbNailImageView.layer.cornerRadius = 30.0
            cell.thumbNailImageView.clipsToBounds = true
         }
         
 
        
        
        
        
        
        
        
       
        return cell
    }
    
    
    
    


}