//
//  IplDatabase.swift
//  IPL
//
//  Created by BridgeLabz Solution LLP on 28/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import CoreData
class IplDatabase: NSObject {

    
    class func storeLogoImage(imageData:Data)
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let teamImageObj = TeamLogo(context: context)
       
        teamImageObj.logo = imageData as NSData?
     
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
 
        
    }
    
    
    class func storeImages(imageData1:Data,imageData2:Data,imageData3:Data)
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let teamImageObj = TeamInfoImages(context: context)
        
        teamImageObj.background = imageData1 as NSData?
        teamImageObj.captain = imageData2 as NSData?
        teamImageObj.ground = imageData3 as NSData?
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
    }
    
    class func fetchImages() ->[TeamInfoImages]
    {
        var teamLogo : [TeamInfoImages] = []
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            try teamLogo = context.fetch(TeamInfoImages.fetchRequest())
            
        }
        catch{
            print("fetching failed")
            
        }
        return teamLogo
        
        
    }
    

    


    
 
    class func fetchteamLogoImage() ->[TeamLogo]
    {
        var teamLogo : [TeamLogo] = []
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
           try teamLogo = context.fetch(TeamLogo.fetchRequest())
            
        }
        catch{
            print("fetching failed")
            
        }
        return teamLogo
        
            
        }

    
    
}
