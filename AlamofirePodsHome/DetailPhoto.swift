

import Foundation
import ImageLoader

class DetailPhoto: UIViewController {
    @IBOutlet weak var imageDetailPhoto: UIImageView!

    var owner_id = ""
    var album_id = ""
    var url = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
      
        imageDetailPhoto.load(url)
   
    
        
        
        print (url)
        
    }
       
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
}