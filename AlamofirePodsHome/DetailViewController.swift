


import UIKit
import ImageLoader

class DetailViewController: UIViewController {

    @IBOutlet weak var bDateLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func photoAlbBtn(sender: AnyObject) {
        
      
        
        
    }
    
    
    var imageUser: UIImage = UIImage(named: "img_nature")!
    var bDate = ""
    var firstName = ""
    var lastName = ""
    var userFriendId: Int = 0
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        bDateLabel.text = bDate
        lastNameLabel.text = lastName
        firstNameLabel.text = firstName
        imageView.load(url)
    
  
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
