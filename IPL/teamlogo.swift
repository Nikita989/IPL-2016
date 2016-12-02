//
//  teamlogo.swift
//  IPL
//
//  Created by BridgeLabz Solution LLP on 17/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import Firebase
class teamlogo: NSObject {
    
    var ref:FIRDatabaseReference!
    
    var teamArray:[teams] = []
    var teamdata = [NSDictionary]()
    var teamControllerVar:teamController?
    var i:Int = 0
    
    
    
    
    func fetchData()
    {
    
        ref = FIRDatabase.database().reference()
        print(ref)
        ref.child("teams").observeSingleEvent(of: .value, with: { (snapshot) in
           
        self.teamdata = snapshot.value as! [NSDictionary]
            for i in 0..<self.teamdata.count{
                
                let valueatIndex = self.teamdata[i] as NSDictionary
                let teamImageVal = valueatIndex["team_img_url"] as! String
                let teamNameVal = valueatIndex ["team_name"] as! String
                let teamObj = teams(teamImage:teamImageVal,teamName:teamNameVal)
                self.teamArray.append(teamObj)
                
                
            }
            print("*******************",self.teamArray.count)
            self.teamControllerVar?.sendServiceData(teamArray: self.teamArray)
            
        }) { (error) in
            print(error.localizedDescription)
            
        }
      

}
    
    func fetchImagefromDatabase(imageName:String)
    {
        
         let logoArray = IplDatabase.fetchteamLogoImage()
        if logoArray.count == teamArray.count {
            let image = UIImage(data: logoArray[i].logo as! Data)
            i+=1
            self.teamControllerVar?.getImagefromServices(Image: image!)
        
        }
        else {
            
            let storage = FIRStorage.storage()
            let storageref = storage.reference(forURL: "gs://iplproject-53c7c.appspot.com")
            
            let path = storageref.child(imageName)
            path.data(withMaxSize: 1 * 1024 * 1024) { (data, error) -> Void in
                if (error != nil) {
                    // Uh-oh, an error occurred!
                    print(1234566799908765)
                } else {
                    
                    let islandImage: UIImage! = UIImage(data: data!)
                    IplDatabase.storeLogoImage(imageData: data!)
                    
                    self.teamControllerVar?.getImagefromServices(Image: islandImage)
                }
                
                
            }
        }
        

    }
    
}
