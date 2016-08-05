//
//  NewViewController.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 8/3/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//


import UIKit
class DetailViewController: UIViewController {

    @IBOutlet weak var bDateLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    var imageUser = ""
    var bDate = ""
    var firstName = ""
    var lastName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imageUser)
        bDateLabel.text = bDate
        lastNameLabel.text = lastName
        firstNameLabel.text = firstName
        
    }
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
}
