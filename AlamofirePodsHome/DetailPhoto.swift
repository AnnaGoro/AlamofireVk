//
//  DetailPhoto.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 8/7/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import ImageLoader

class DetailPhoto: UIViewController {
    @IBOutlet weak var imageDetailPhoto: UIImageView!

    var owner_id = ""
    var album_id = ""
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //imageView.image = imageUser
      
        imageDetailPhoto.load(url)
        //imageView.layer.cornerRadius = 100.0
        // imageView.clipsToBounds = true
        //TODO add buttons with segues to other methods and send data (user_id)!!!!!
        
        
        print (url)
        
    }
       
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
}