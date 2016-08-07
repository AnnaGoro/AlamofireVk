//
//  PhotoAlbumsCollectionViewController.swift
//  AlamofirePodsHome
//
//  Created by Ann Goro on 8/7/16.
//  Copyright © 2016 Ann Goro. All rights reserved.
//

import Foundation
import UIKit
import ImageLoader


class PhotoAlbumsCollectionViewController : UIViewController  {
    @IBOutlet var collectionData: UICollectionView!
    
    //@IBOutlet weak var collectionData: UICollectionView!
    
    var photoGetService = PhotoGetService()
    var owner_id = String()
    var album_id = String()
    var albumsModelArray : [AlbumModel] = [AlbumModel] ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //var s = owner_id as! String
        
     //   photoGetService.getAlbumsJSON(owner_id)
        photoGetService.getAlbums(owner_id) { (data) in
            var photoModelArr = data.1
            for value in photoModelArr {
                //print (value.aid)
                self.albumsModelArray.append(value)
                print ("************\(value.aid)*********")
                
            }
            
            self.collectionData.reloadData()
            
          //  print ("get albums \(data.1[0].toJSONString())   \(data.0)")
            
            
        }
        
        
    }
    
    let reuseIdentifier = "photoAlbumsCell"
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         print ("func collection view self.albumsModelArray.count")
        return self.albumsModelArray.count
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PhotoAlbumsCell
        print ("func collection view")
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.albumNameLabel.text = self.albumsModelArray[indexPath.item].title
        
        let URL = albumsModelArray[indexPath.row].thumb_src!
        let placeholder = UIImage(named: "img_nature")!
        cell.imageAlbum.load(URL, placeholder: placeholder) { URL, image, error, cacheType in
            print("URL \(URL)")
            print("error \(error)")
            print("image \(image?.size), render-image \( cell.imageAlbum.image?.size)")
            print("cacheType \(cacheType.hashValue)")
            if cacheType == CacheType.None {
                let transition = CATransition()
                transition.duration = 0.5
                transition.type = kCATransitionFade
                cell.imageAlbum.layer.addAnimation(transition, forKey: nil)
                cell.imageAlbum.image = image
                
                
            }
            
            //cell.imageAlbum.layer.cornerRadius = 30.0
            //cell.imageAlbum.clipsToBounds = true
        }
        
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showPhotos" {
            
            
            let destinationController = segue.destinationViewController as! PhotosCollectionController
            
            
            destinationController.owner_id = owner_id
            
            destinationController.album_id = album_id

            
            
        }
        

    }
        
        
    
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        
        self.owner_id = String(albumsModelArray[indexPath.item].owner_id)
        self.album_id = String(albumsModelArray[indexPath.item].aid)
        print("You selected cell #\(indexPath.item)!")
        self.performSegueWithIdentifier("showPhotos", sender:nil)


    }

}
