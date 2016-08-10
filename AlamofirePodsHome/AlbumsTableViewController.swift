

import Foundation
import UIKit

class AlbumsAudioTableViewController: UITableViewController {

   //, UITableViewDataSource, UITableViewDelegate
    @IBOutlet var tableData: UITableView!

 
    var owner_id : Int = 0
    var audioGetService = AudioGetService()
    var photoGetService = PhotoGetService()
    
    var audioAlbumModelArray : [AudioAlbumModel] = [AudioAlbumModel] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoGetService.getAlbumsJSON(String(owner_id))
        
        audioGetService.getAudioAlbumsJSON(String(owner_id))
        
        audioGetService.getAudioAlbums (String(owner_id)) { data in
            
            
            let audioAlbumModelArr = data.1
            for value in audioAlbumModelArr {
                print (" get audioAlbums from \(value.owner_id)")
                self.audioAlbumModelArray.append(value)
                
                
            }
            
            self.tableData.reloadData()

        
        
        }
        
          }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return audioAlbumModelArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cellAudioAlbums"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath) as! CustomCellAudio
        
        cell.cellAudioAlbum.text = String(audioAlbumModelArray[indexPath.row].title!)
        
        return cell
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showAudiosFromAlbum" {
            if let indexPath = tableData.indexPathForSelectedRow {
                
                let destinationController = segue.destinationViewController as! AudiosViewController
                
                
                destinationController.album_id = audioAlbumModelArray[indexPath.row].album_id!
        
                destinationController.owner_id = audioAlbumModelArray[indexPath.row].owner_id!
               
                
            }
        }
        
       
        if segue.identifier == "showAudiosFromUser" {
            
           
                
            let destinationController = segue.destinationViewController as! AllAudioTableViewController
                
               destinationController.owner_id = owner_id
                
                            
                
            
        }
    
    


    }


}

