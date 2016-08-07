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
    
    var photoGetService = PhotoGetService()
    
    @IBOutlet weak var tableData: UITableView!
    var sendImage: UIImage = UIImage()
    var audioGetService = AudioGetService()
    var userGetService = UserGetService()
    var userModelArray : [UserModel] = [UserModel] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //userGetService.getFriendsJSON ()
       // photoGetService.getAlbumsJSON ()
        
        
        userGetService.getFriends() { (data) in
            var userModelArray = data.1
            for value in userModelArray {
                self.userModelArray.append(value)
            }
            
            self.tableData.reloadData()
            
            print ("get user by id \(data.1[0].toJSONString())   \(data.0)")
            print ("get user from array \(userModelArray[0].first_name)   \(data.0)")
            print ("get id from array \(userModelArray[0].id)   \(data.0)")
            
        }
        
     
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userModelArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "Cell"
        tableView.tableFooterView = UIView()
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! CustomCellUser
        
        cell.firstNameLabel?.text = userModelArray[indexPath.row].first_name
        cell.lastNameLabel?.text = userModelArray[indexPath.row].last_name
        
        cell.bDateLabel?.text = userModelArray[indexPath.row].bdate ?? "no bDate"
       
        let URL = self.userModelArray[indexPath.row].photo_50!
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
                
                self.sendImage = image!
                
                
            }
            
            cell.thumbNailImageView.layer.cornerRadius = 35.0
            cell.thumbNailImageView.clipsToBounds = true
        }
        
       
        return cell
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableData.indexPathForSelectedRow {
            
            let destinationController = segue.destinationViewController as! DetailViewController
           
                destinationController.firstName = userModelArray[indexPath.row].first_name!
                destinationController.lastName = userModelArray[indexPath.row].last_name!
                destinationController.bDate = userModelArray[indexPath.row].bdate ?? "no bDate"
                destinationController.url = userModelArray[indexPath.row].photo_200_orig!
                destinationController.userFriendId = userModelArray[indexPath.row].user_id!
                 var s = userModelArray[indexPath.row].user_id
                print ("********* id \(s)")
               
            }
    }
    
    
    
    
    
    
    
    }
    
    
    
}