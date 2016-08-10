

import Foundation
import UIKit
import ImageLoader


class PhotoAlbumsCollectionViewController : UIViewController  {
    @IBOutlet var collectionData: UICollectionView!
    
  
    
    var photoGetService = PhotoGetService()
    var owner_id : Int = 0
  
    var album_id: Int = 0
    var albumsModelArray : [AlbumModel] = [AlbumModel] ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        
        photoGetService.getAlbumsJSON(String(owner_id))
        photoGetService.getAlbums(String(owner_id)) { (data) in
            let photoModelArr = data.1
            for value in photoModelArr {
                
                self.albumsModelArray.append(value)
               
            }
            
            self.collectionData.reloadData()
            
     
            
            
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
            if let cell = sender as? PhotoAlbumsCell {
            let  indexPath = collectionData.indexPathForCell(cell)
            
            let destinationController = segue.destinationViewController as! PhotosCollectionController
         
            destinationController.owner_id = owner_id
            
            destinationController.album_id = albumsModelArray[indexPath!.row].aid!

            }
            
        }
        

    }
        
        
    
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
     
       

    }

}
