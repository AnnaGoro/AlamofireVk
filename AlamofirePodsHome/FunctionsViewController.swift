//
//  FunctionsViewController.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 8/2/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import UIKit

class FunctionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet weak var tableData: UITableView!
    //let array = ["1", "02", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13"]
    var array: [String] = [String] ()
    var audioGetService = AudioGetService()
    var userGetService = UserGetService()
    
    var userModelArray : [UserModel] = [UserModel] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // var owner_id = "owner_id=" + NSUserDefaults.standardUserDefaults().stringForKey("user_id")!
        //print("getAudioById1 (owner_id)")
        // audioGetService.getAudioById1 (owner_id)
        // print("getPopularAudioCount(only_eng=1, count: count=10)")
        //audioGetService.getPopularAudioCount("only_eng=1", count: "count=10")
        
        userGetService.getUserById1() { (data) in
            var userModelArray = data.1
            for value in userModelArray {
            
            self.array.append(value.first_name!)
            
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
      return array.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       let cellId = "Cell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! CustomCellUser
        
        cell.firstNameLabel?.text = array[indexPath.row]
        cell.thumbNailImageView?.image = UIImage(named: "img_nature")
        
         cell.thumbNailImageView.layer.cornerRadius = 30.0
         cell.thumbNailImageView.clipsToBounds = true
        return cell
    }
    
    
    
    


}