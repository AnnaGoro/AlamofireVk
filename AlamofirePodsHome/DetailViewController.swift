//
//  NewViewController.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 8/3/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//


import UIKit
import ImageLoader

class DetailViewController: UIViewController {

    @IBOutlet weak var bDateLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func photoAlbBtn(sender: AnyObject) {
        
       // go()
        
        
    }
    
    
    var imageUser: UIImage = UIImage(named: "img_nature")!
    var bDate = ""
    var firstName = ""
    var lastName = ""
    var userFriendId: Int = 0
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //imageView.image = imageUser
        bDateLabel.text = bDate
        lastNameLabel.text = lastName
        firstNameLabel.text = firstName
        imageView.load(url)
        //imageView.layer.cornerRadius = 100.0
       // imageView.clipsToBounds = true
        //TODO add buttons with segues to other methods and send data (user_id)!!!!!
        
        
        print (userFriendId)
        
    }
   
   override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPhotoAlbums" {
           
                
                let destinationController = segue.destinationViewController as! PhotoAlbumsCollectionViewController
                
                destinationController.owner_id = userFriendId
    }
    if segue.identifier == "showAudioAlbums" {
        
        
        let destinationController = segue.destinationViewController as! AlbumsAudioTableViewController
        
        destinationController.owner_id = userFriendId
        

    }
        
        
        
    if segue.identifier == "showDialogs" {
        
        
        //let destinationController = segue.destinationViewController as! AlbumsAudioTableViewController
        
        //destinationController.owner_id = userFriendId
        
        
    }

        
        
    
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
}
