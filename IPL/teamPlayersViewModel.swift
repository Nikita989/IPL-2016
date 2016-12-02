//
//  teamPlayersViewModel.swift
//  IPL
//
//  Created by BridgeLabz Solution LLP on 24/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class teamPlayersViewModel: NSObject {

    
    var playersViewControllervar:PlayersViewController?
    var teamPlayersControllerVar:teamPlayersController?
    var totalPlayerArr:[String] = []
    var count:Int = 0
    var teamNamevar:String = ""
    var ImageName:String = ""
    var clickedIndex:Int?
    var logoImage:UIImage?
    var  totalLogoArray:[String] = []
    
    func sendDataToView(playerArr:[String])
    {
        totalPlayerArr = playerArr
        self.checkArrayCount()
        
        
    }
    
    func checkCount(teamName:String)
    {
        teamNamevar = teamName
        
        if totalPlayerArr.count==0 {
            
            teamPlayersControllerVar = teamPlayersController()
            teamPlayersControllerVar?.teamPlayersViewModelVar = self
            teamPlayersControllerVar?.fetchPlayersFromServices(teamName: teamName)
            
        }
        else{
            
            count = totalPlayerArr.count
//            self.fetchImage()
            
        }
        

    }
    
    func checkArrayCount()
    {
        
        if totalPlayerArr.count == 0
        {
           teamPlayersControllerVar?.fetchPlayersFromServices(teamName: teamNamevar)
            
        }
        
        else
        {
             count = totalPlayerArr.count
             self.fetchLogoFromController()
           
            
        }
        
        
    }

     func fetchLogoFromController()
     {
        teamPlayersControllerVar?.fetchLogofromServices()

    }
    
    
    func sendLogoArrToView(logoarray:[String])
    {
        if logoarray.count == 0
        {
            
            teamPlayersControllerVar?.fetchLogofromServices()
        }
        else
        {
            totalLogoArray = logoarray
            self.fetchImageFromController()
        }
        
    }
    
    func fetchImageFromController()
    {
        ImageName = totalLogoArray[clickedIndex!]
        teamPlayersControllerVar?.fetchImageFromServices(logoName: ImageName)
        
    }
    
    func sendImagetoView(image:UIImage)
    {
         logoImage = image
         playersViewControllervar?.reload()
    }

}
