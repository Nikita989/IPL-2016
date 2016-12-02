//
//  teamInformation.swift
//  IPL
//
//  Created by BridgeLabz Solution LLP on 23/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import Firebase


class teamInformation: NSObject {
    
    var teamInfoControllerVar:teamInfoController?
    var islandImage1: UIImage?
    var islandImage2: UIImage?
    var islandImage3: UIImage?
    var data1:Data?
    var data2:Data?
    var data3:Data?
    
     var ref:FIRDatabaseReference!
    var flag1:Bool = false
    var flag2:Bool = false
    var flag3:Bool = false
    var teamInfodata:[NSDictionary] = []
    var teamInfoArray:[teamInfo] = []
    var i:Int?
    var j:Int = 8
    
    func fetchteamInfo()
    {
        
        ref = FIRDatabase.database().reference()
        print(ref)
        ref.child("grounds").observeSingleEvent(of: .value, with: { (snapshot) in
            
            self.teamInfodata = snapshot.value as! [NSDictionary]
            for i in 0..<self.teamInfodata.count{
                
                let valueatIndex = self.teamInfodata[i] as NSDictionary
                
                let teamBackground = valueatIndex["team_background"] as! String
                let teamCaptain = valueatIndex ["team_captain"] as! String
                let teamCoach = valueatIndex ["team_coach"] as! String
                let teamGround = valueatIndex ["team_ground"] as! String
                let teamHomeVenue = valueatIndex ["team_home_venue"] as! String
                let teamCaptainImage = valueatIndex ["team_img_url"] as! String
                let teamName = valueatIndex ["team_name"] as! String
                let teamOwner = valueatIndex ["team_owner"] as! String
                
                let teamInfoObj = teamInfo(teamBackgroundval:teamBackground,teamCaptainval:teamCaptain,teamCoachval:teamCoach,teamGroundval:teamGround,teamHomeVenueval:teamHomeVenue,teamCaptainImageval:teamCaptainImage,teamNameval:teamName,teamOwnerval:teamOwner)
                self.teamInfoArray.append(teamInfoObj)
                
            }
            print("*******************",self.teamInfoArray.count)
            
            self.teamInfoControllerVar?.sendTeamInfoToViewmodel(teamInfoArray:self.teamInfoArray)
           
//
        }) { (error) in
            print(error.localizedDescription)

        }
    
    }
    
    
    func fetchImageFromDatabase(backGroundName:String,captainImageName:String,groundImageName:String)
    {
//        let logoArray = IplDatabase.fetchImages()
//        if j==8{
//            let image1 = UIImage(data: logoArray[i!].background as! Data)
//            let image2 = UIImage(data: logoArray[i!].captain as! Data)
//            let image3 = UIImage(data: logoArray[i!].ground as! Data)
//            //i+=1
//            self.teamInfoControllerVar?.sendImagetoViewmodel(teamBackground: image1!, teamCaptain: image2!, groundImage: image3!)
//        }
//        else{
           //j = i+1
            let storage = FIRStorage.storage()
            let storageref = storage.reference(forURL: "gs://iplproject-53c7c.appspot.com")
            
            let path = storageref.child(backGroundName)
            path.data(withMaxSize: 1 * 1024 * 1024) { (data, error) -> Void in
                if (error != nil) {
                    // Uh-oh, an error occurred!
                    print(1234566799908765)
                } else {
                    
                    
                    self.islandImage1 = UIImage(data: data!)
                    self.data1 = data
                    print("*************",self.islandImage1!)
                    self.flag1 = true
                    print("**********flag1 is",self.flag1)
                    
                    if (self.flag1 && self.flag2 && self.flag3) {
                        IplDatabase.storeImages(imageData1: self.data1!, imageData2: self.data2!, imageData3: self.data3!)
                        self.teamInfoControllerVar?.sendImagetoViewmodel(teamBackground: self.islandImage1!,teamCaptain: self.islandImage2!,groundImage:self.islandImage3!)
                    }
                    //                self.teamControllerVar?.getImagefromServices(Image: islandImage)
                }
                
            }
            
            let path1 = storageref.child(captainImageName)
            path1.data(withMaxSize: 1 * 1024 * 1024) { (data, error) -> Void in
                if (error != nil) {
                    // Uh-oh, an error occurred!
                    print(1234566799908765)
                } else {
                    
                    self.islandImage2 = UIImage(data: data!)
                    self.data2 = data
                    print("*************",self.islandImage2!)
                    self.flag2 = true
                    print("**********flag2 is",self.flag2)
                    
                    if (self.flag1 && self.flag2 && self.flag3) {
                        IplDatabase.storeImages(imageData1: self.data1!, imageData2: self.data2!, imageData3: self.data3!)
                        self.teamInfoControllerVar?.sendImagetoViewmodel(teamBackground: self.islandImage1!,teamCaptain: self.islandImage2!,groundImage:self.islandImage3!)
                    }
                    //                self.teamControllerVar?.getImagefromServices(Image: islandImage)
                }
                
            }
            
            
            let path2 = storageref.child(groundImageName)
            path2.data(withMaxSize: 1 * 1024 * 1024) { (data, error) -> Void in
                if (error != nil) {
                    // Uh-oh, an error occurred!
                    print(1234566799908765)
                } else {
                    
                    
                    self.islandImage3 = UIImage(data: data!)
                    self.data3 = data
                    print("*************",self.islandImage3!)
                    self.flag3 = true
                    print("**********flag3 is",self.flag3)
                    
                    if (self.flag1 && self.flag2 && self.flag3) {
                        IplDatabase.storeImages(imageData1: self.data1!, imageData2: self.data2!, imageData3: self.data3!)
                        self.teamInfoControllerVar?.sendImagetoViewmodel(teamBackground: self.islandImage1!,teamCaptain: self.islandImage2!,groundImage:self.islandImage3!)
                    }
                    
                    
                }
                
                
                
                
            }
        }
     

        
        
        

        
    

}
