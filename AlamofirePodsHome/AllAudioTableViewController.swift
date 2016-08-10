//
//  AudiosViewController.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 8/3/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import UIKit

class AllAudioTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableData: UITableView!
    
 
    
    var owner_id : Int = 0
    var audioGetService = AudioGetService()
    
    
    var audioModelArray : [AudioModel] = [AudioModel] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print ("********* all audios from user owner_id **********")
        print (owner_id)
        
        audioGetService.getAudiosFromUserJSON(String(owner_id))
        audioGetService.getAllAudiosFromUser(String(owner_id)) { data in
            
            
            let audioAlbumModelArr = data.1
            for value in audioAlbumModelArr {
                print (" get audios from \(value.owner_id)")
                self.audioModelArray.append(value)
                
                
            }
            
            self.tableData.reloadData()
            
        }
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return audioModelArray.count
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cellUserAudios"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! CellUserAudios
        
        cell.userAudiosLabel.text = String(audioModelArray[indexPath.row].title!)
       
        return cell
    }
    
    
    
    
    
    
}