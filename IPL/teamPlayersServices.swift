//
//  teamPlayersServices.swift
//  IPL
//
//  Created by BridgeLabz Solution LLP on 24/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase
import FirebaseStorage

class teamPlayersServices: NSObject {
    
    var ref:FIRDatabaseReference!
    var teamPlayersControllerVar:teamPlayersController?
    var teamPLayersArr:NSArray = []
    var playersArray:[String] = []
    var teamLogoData:[NSDictionary] = []
     var logoName:String?
    var totalArray:[NSDictionary] = []
    var logoArray : [String] = []
    
    
    func fetchTeamPlayersfromDatabase(teamName:String)
    {
        
        ref = FIRDatabase.database().reference()
        print(ref)
        ref.child("players").child(teamName).observeSingleEvent(of: .value, with: { (snapshot) in
            
            
          self.teamPLayersArr = snapshot.value as! NSArray
            for i in 0..<self.teamPLayersArr.count{
                
               let valueAtIndex = self.teamPLayersArr[i] as! NSDictionary
             let playerName = valueAtIndex["player_name"] as! String
                self.playersArray.append(playerName)
                
            }
            
           print("*******************",self.playersArray.count)
            self.teamPlayersControllerVar?.sendDatatoViewModel(playersArray: self.playersArray)
            
            
        }) { (error) in
            print(error.localizedDescription)
            
        }
        
        

        
    }
    
    
    func fetchLogoArray()
    {
        
        ref = FIRDatabase.database().reference()
        print(ref)
        ref.child("teams").observeSingleEvent(of: .value, with: { (snapshot) in
            
            
            self.totalArray = snapshot.value as! [NSDictionary]
            for i in 0..<self.totalArray.count{
                
                let value = self.totalArray[i]  as NSDictionary
                let logoName = value["team_img_url"] as! String
                self.logoArray.append(logoName)
                
            }
            
            print("*******************",self.logoArray.count)
           
          self.teamPlayersControllerVar?.sendLogoArraytoViewModel(logoarray: self.logoArray)
            
        }) { (error) in
            print(error.localizedDescription)
            
        }
        
   
        
    }

    func fetchLogoImage(logoName:String)
   {
     let storage = FIRStorage.storage()
     let storageref = storage.reference(forURL: "gs://iplproject-53c7c.appspot.com")
    
    let path = storageref.child(logoName)
    path.data(withMaxSize: 1 * 1024 * 1024) { (data, error) -> Void in
        if (error != nil) {
            // Uh-oh, an error occurred!
            print(1234566799908765)
        } else {
            
            let image: UIImage! = UIImage(data: data!)
            self.teamPlayersControllerVar?.sendImageToViewModel(image: image)

        }
        
        
    }

    
   }


}
