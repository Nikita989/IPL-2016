//
//  playerInfoServices.swift
//  IPL
//
//  Created by BridgeLabz Solution LLP on 26/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase

class playerInfoServices: NSObject {
    
    var playerInoControllerVar:playerInfoController?
    var ref:FIRDatabaseReference!
    var playerArr:NSArray = []
    var playerInfovar:playerInfoModel?

    func fetchInfoFromDatabase(selectedIndex:Int,name:String)
    {
        ref = FIRDatabase.database().reference()
        print(ref)
        ref.child("players").child(name).observeSingleEvent(of: .value, with: { (snapshot) in
            
            
            self.playerArr = snapshot.value as! NSArray
            
                
            let valueAtIndex = self.playerArr[selectedIndex] as! NSDictionary
            let battingStyle = valueAtIndex["player_batting_style"] as! String
            let BowlingStyle = valueAtIndex["player_bowling_style"] as! String
            let playerDob = valueAtIndex["player_dob"] as! String
            let playerImage = valueAtIndex["player_img_url"] as! String
            let playerName = valueAtIndex["player_name"] as! String
            let nationality = valueAtIndex["player_nationality"] as! String
            let role = valueAtIndex["player_role"] as! String
            
          let playerObj = playerInfoModel(Name: playerName,Role: role,Nationality: nationality,Batting: battingStyle,Bowling: BowlingStyle,DOB: playerDob,ImageName: playerImage)
                self.playerInfovar = playerObj
            
           
            
        
            self.playerInoControllerVar?.sendArrayToViewModel(array1: self.playerInfovar!)
            
        }) { (error) in
            print(error.localizedDescription)
            
        }
        
    }
    
    
    func fetchPlayerImagefromDatabase(imageName:String)
    {
        
        let storage = FIRStorage.storage()
        let storageref = storage.reference(forURL: "gs://iplproject-53c7c.appspot.com")
        
        let path = storageref.child(imageName)
        path.data(withMaxSize: 1 * 1024 * 1024) { (data, error) -> Void in
            if (error != nil) {
                // Uh-oh, an error occurred!
                print(1234566799908765)
            } else {
                
                let islandImage: UIImage! = UIImage(data: data!)
                
                self.playerInoControllerVar?.sendImageViewModel(image: islandImage)
            }
            
            
        }
        
    }


}
