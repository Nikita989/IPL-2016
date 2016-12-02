//
//  teamModel.swift
//  IPL
//
//  Created by BridgeLabz Solution LLP on 18/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class teamModel: NSObject {

    var viewobj:ViewController?
    
    var  controllerobj:teamController?
    
    var teamArray:[teams] = []
    var Teamarray:[teams] = []
    var count = 0
    var imageName : String = ""
    
    var ImageFound:[UIImage] = []
    var i:Int = 0
    
    var TeamImageArray:[UIImage] = []
    
    
    
    
    
    func sendControllerData(teamsArray:[teams])
    {
        Teamarray = teamsArray
        self.checkCount()
    
    }
    
    
    
    
    func checkCount() ->Void
    {
        
        if Teamarray.count==0 {
            
            controllerobj = teamController()
            controllerobj?.teamVar=self
            controllerobj?.fetchservicedata()
        }
        else{
        
      count = Teamarray.count
           self.fetchImage()
            
        }
        
        //return count
    }
    
   func fetchImage()
   {
        imageName = Teamarray[i].teamImage!
       print(imageName)
        controllerobj?.fetchImagefromServices(imageView: imageName)
        i+=1
    
    }
    
    func getImagefromController(Image:UIImage)
    {
        
         ImageFound.append(Image)
        print(ImageFound.count)
        if ImageFound.count<Teamarray.count
        {
        self.fetchImage()
        }
        else
        {
        self.checkImageCount(ImageArray: ImageFound)
        }
      
    }
    
    func checkImageCount(ImageArray:[UIImage])
    {
        
        if Teamarray.count == ImageFound.count {
            
            TeamImageArray = ImageArray
            print("*********************",TeamImageArray)
            viewobj?.reload()
            
        }
        
    }
    
    
}
