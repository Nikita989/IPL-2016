//
//  teamInfoController.swift
//  IPL
//
//  Created by BridgeLabz Solution LLP on 23/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class teamInfoController: NSObject {
    
    
    var teamInfoViewmodelvar:teamInfoModel?
    
    var teamInformationVar:teamInformation?
    var index:Int?
    
    func fetchTeamInfofromServices()
    {
        
        teamInformationVar = teamInformation()
        teamInformationVar?.teamInfoControllerVar = self
        teamInformationVar?.i = index
        teamInformationVar?.fetchteamInfo()
        
    }
    
    
    func sendTeamInfoToViewmodel(teamInfoArray:[teamInfo])
    {
        teamInfoViewmodelvar?.sendteamInfoToView(teamInfoArray:teamInfoArray)
        
    }
    
    func fetchImageFromServices(backGroundName:String,captainImageName:String,groundImageName:String)
    {
        
        teamInformationVar?.fetchImageFromDatabase(backGroundName: backGroundName,captainImageName: captainImageName,groundImageName:groundImageName)
    }
    
    
    func sendImagetoViewmodel(teamBackground:UIImage,teamCaptain:UIImage,groundImage:UIImage)
    {
        teamInfoViewmodelvar?.sendImagetoView(teamBackground: teamBackground,teamCaptain: teamCaptain,groundImage:groundImage)
        
    }

}
