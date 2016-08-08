//
//  AlbumsTableViewController.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 8/7/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import UIKit

class AlbumsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    var arrayAudiosTitles: [String] = [String] ()
    
    var audioGetService = AudioGetService()
    
    
    var audioModelArray : [AudioModel] = [AudioModel] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       /*
        audioGetService.getAlbums(owner_id)) { (data) in
            print("getPopularAudioCount")
            var audioModelArray = data.1
            for value in audioModelArray {
                
                self.arrayAudiosTitles.append(value.title!)
                print (value.title!)
                
            }
            
            self.tableData.reloadData()
            
            print ("get audio by id \(data.1[0].toJSONString())   \(data.0)")
            
        }
        */
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayAudiosTitles.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cellAudioAlbums"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath)
        
        //cell.label.text = arrayAudiosTitles[indexPath.row]
        
        return cell
    }
    
    
    
    
    





}

