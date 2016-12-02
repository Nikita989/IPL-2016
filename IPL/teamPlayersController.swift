//
//  teamPlayersController.swift
//  IPL
//
//  Created by BridgeLabz Solution LLP on 24/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class teamPlayersController: NSObject {
    
    var teamPlayersViewModelVar:teamPlayersViewModel?
    var teamPLayersServicesVar:teamPlayersServices?
    
    func fetchPlayersFromServices(teamName:String)
    {
        teamPLayersServicesVar = teamPlayersServices()
        teamPLayersServicesVar?.teamPlayersControllerVar = self
        teamPLayersServicesVar?.fetchTeamPlayersfromDatabase(teamName: teamName)
        
    }
    
    func sendDatatoViewModel(playersArray:[String])
    {
        teamPlayersViewModelVar?.sendDataToView(playerArr: playersArray)
        
    }
    
    func fetchLogofromServices()
    {
        teamPLayersServicesVar?.fetchLogoArray()
        
    }

    func sendLogoArraytoViewModel(logoarray:[String])
     {
        
        teamPlayersViewModelVar?.sendLogoArrToView(logoarray:logoarray)
    }
    
    
    func fetchImageFromServices(logoName:String)
    {
        teamPLayersServicesVar?.fetchLogoImage(logoName: logoName)
        
    }
    
    func sendImageToViewModel(image:UIImage)
    {
       teamPlayersViewModelVar?.sendImagetoView(image: image)

    
    }


}
