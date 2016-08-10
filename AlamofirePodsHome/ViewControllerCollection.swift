
import UIKit
import ImageLoader

class ViewControllerCollection: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionData: UICollectionView!
    var arrayFirstNames: [String] = [String] ()
    
    var arrayLastNames: [String] = [String] ()
    
    var arrayUrlsPhoto: [String] = [String] ()
    
    var arrayBdates: [String] = [String] ()
    
    var audioGetService = AudioGetService()
    var userGetService = UserGetService()
    
    var userModelArray : [UserModel] = [UserModel] ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userGetService.getUserById1() { (data) in
            var userModelArray = data.1
            for value in userModelArray {
                
                self.arrayFirstNames.append(value.first_name!)
                self.arrayLastNames.append(value.last_name!)
                let theAnswer = value.bdate ?? "no bDate"
                self.arrayBdates.append(theAnswer)
                self.arrayUrlsPhoto.append(value.photo_50!)
                
                
            }
            
            self.collectionData.reloadData()
                       
        }
        
        
    }

        let reuseIdentifier = "cell" 
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayFirstNames.count
    }
    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = self.arrayFirstNames[indexPath.item]
        
        cell.lastNamesCVLabel.text = self.arrayLastNames[indexPath.item]
        cell.bDatesCVLabel.text = self.arrayBdates[indexPath.item]
        
        let URL = arrayUrlsPhoto[indexPath.row]
        let placeholder = UIImage(named: "img_nature")!
        cell.imageViewCV.load(URL, placeholder: placeholder) { URL, image, error, cacheType in
            print("URL \(URL)")
            print("error \(error)")
            print("image \(image?.size), render-image \(cell.imageViewCV.image?.size)")
            print("cacheType \(cacheType.hashValue)")
            if cacheType == CacheType.None {
                let transition = CATransition()
                transition.duration = 0.5
                transition.type = kCATransitionFade
                cell.imageViewCV.layer.addAnimation(transition, forKey: nil)
                cell.imageViewCV.image = image
                
                
            }
            
            cell.imageViewCV.layer.cornerRadius = 30.0
            cell.imageViewCV.clipsToBounds = true
        }
        
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
}








