//
//  teamController.swift
//  IPL
//
//  Created by BridgeLabz Solution LLP on 18/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class teamController: NSObject {
    var serviceObj: teamlogo?
    var teamArray:[teams] = []
    var teamVar:teamModel?
    var serviceVar:teamlogo?
    
    
    
    
    func fetchservicedata()    {
        serviceObj = teamlogo()
        serviceObj?.teamControllerVar = self
        
        (serviceObj?.fetchData())!
    
    }
    
    func sendServiceData(teamArray:[teams])
     {
//        var TeamsArray:[teams]?
//        
//        TeamsArray = teamArray
        
        teamVar?.sendControllerData(teamsArray: teamArray)
    }
    
    func fetchImagefromServices(imageView:String)
    {
        
        serviceObj?.fetchImagefromDatabase(imageName: imageView)
        
    }
    
    func getImagefromServices(Image:UIImage)
    {
        
        teamVar?.getImagefromController(Image: Image)
        
    }
}
