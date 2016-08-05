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
    
    
    
    var imageUser: UIImage = UIImage(named: "img_nature")!
    var bDate = ""
    var firstName = ""
    var lastName = ""
    var index = 0
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //imageView.image = imageUser
        bDateLabel.text = bDate
        lastNameLabel.text = lastName
        firstNameLabel.text = firstName
        imageView.load(url)
        imageView.layer.cornerRadius = 35.0
        imageView.clipsToBounds = true
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
}
