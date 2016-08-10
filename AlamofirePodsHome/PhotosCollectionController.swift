

import Foundation
import UIKit
import ImageLoader


class PhotosCollectionController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  {

    @IBOutlet var collectionData: UICollectionView!
    

    
    var photoGetService = PhotoGetService()
    var owner_id : Int = 0
    var album_id : Int = 0
    var photosModelArray : [PhotoModel] = [PhotoModel] ()
    var url = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        print ("PhotosCollectionController")
        photoGetService.getPhotosJSON (String(owner_id), album_id: String (album_id))
        photoGetService.getPhotos(String(owner_id), album_id: String (album_id)) { (data) in
            let photoModelArr = data.1
            for value in photoModelArr {
                print (" get photos from \(value.owner_id)")
                self.photosModelArray.append(value)
                
                
            }
            
            self.collectionData.reloadData()
            
            
            
        }
        
        
    }
    
    let reuseIdentifier = "photoCell"
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print ("func collection view self.albumsModelArray.count")
        return self.photosModelArray.count
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PhotoCell
     
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        
       let URL = photosModelArray[indexPath.row].src_xxxbig ?? photosModelArray[indexPath.row].src_xxbig!
      
        
        let placeholder = UIImage(named: "img_nature")!
        cell.photoImageView.load(URL, placeholder: placeholder) { URL, image, error, cacheType in
            print("URL \(URL)")
            print("error \(error)")
            print("image \(image?.size), render-image \( cell.photoImageView.image?.size)")
            print("cacheType \(cacheType.hashValue)")
            if cacheType == CacheType.None {
                let transition = CATransition()
                transition.duration = 0.5
                transition.type = kCATransitionFade
                cell.photoImageView.layer.addAnimation(transition, forKey: nil)
                cell.photoImageView.image = image
                
                
            }

        }
        
        
        return cell
    }
    
    
    
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     if segue.identifier == "showDetailPhoto" {
   
     
     let destinationController = segue.destinationViewController as! DetailPhoto
     
     
     destinationController.url = url
      
     
     
     
     }
        
    
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
         //??
        url = photosModelArray[indexPath.row].src_xxxbig ?? photosModelArray[indexPath.row].src_xxbig!
        
        
        // Pass control to the PhotoViewController
        self.performSegueWithIdentifier("showDetailPhoto", sender:self)

    }
    
}

