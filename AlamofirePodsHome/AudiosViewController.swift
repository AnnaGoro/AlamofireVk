

import Foundation
import UIKit

class AudiosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableData: UITableView!
  
    var owner_id : Int = 0
    var album_id : Int = 0
    var audioGetService = AudioGetService()
   
    
    var audioModelArray : [AudioModel] = [AudioModel] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioGetService.getAudiosFromAlbumJSON(String(owner_id), album_id: String(album_id))
        
        audioGetService.getAudiosFromAlbum (String(owner_id), album_id: String(album_id)) { data in
            
            
            let audioAlbumModelArr = data.1
            for value in audioAlbumModelArr {
                print (" get photos from \(value.owner_id)")
                self.audioModelArray.append(value)
                
                
            }
            
            self.tableData.reloadData()
            
        }
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return audioModelArray.count
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cellAudios"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! CustomCellAudioList
        
        cell.trololo.text = audioModelArray[indexPath.row].title
        
        return cell
    }
    
    
    
    
    
    
}