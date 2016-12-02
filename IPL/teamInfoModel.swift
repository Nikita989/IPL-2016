//
//  teamInfoModel.swift
//  IPL
//
//  Created by BridgeLabz Solution LLP on 23/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class teamInfoModel: NSObject {

    
    var teamViewControllerVar:teamViewController?
    
    var teamInfoControllerVar:teamInfoController?
    
    var teamInfoArray:[teamInfo] = []
    var i:Int?
    var totalTeamInfoArray:[teamInfo] = []
    var teamBackgroundImage:[UIImage] = []
    var teamCaptainImage:[UIImage] = []
    var teamGroundImage:[UIImage] = []
    var backGroundImageCount:Int = 0
     var captainImageCount:Int = 0
     var groundImageCount:Int = 0
    
    var totalteamBackgroundImage:[UIImage] = []
     var totalteamCaptainImage:[UIImage] = []
    var totalteamGroundImage:[UIImage] = []
    
    func fetchTeamInfoFromController()
    {
       
        teamInfoControllerVar = teamInfoController()
        teamInfoControllerVar?.teamInfoViewmodelvar = self
        teamInfoControllerVar?.index = i
        teamInfoControllerVar?.fetchTeamInfofromServices()
        
    }
    
    
    func sendteamInfoToView(teamInfoArray:[teamInfo])
    {
//        self.totalTeamInfoArray = teamInfoArray
        self.checkCountOfTeaminfo(teamInfoArray: teamInfoArray)
        
    }
    
    func checkCountOfTeaminfo(teamInfoArray:[teamInfo])
    {
        print("@@@@@@@@@@@@@@@@@@@@@@",teamInfoArray.count)
        if teamInfoArray.count==0 {
             self.teamInfoControllerVar?.fetchTeamInfofromServices()
            
        }
        else {
            self.totalTeamInfoArray = teamInfoArray
            print("*************count is",totalTeamInfoArray)
            self.fetchImages()
//            teamViewControllerVar?.setTeamInfo()
            
        }
        
        
    }
    
    func fetchImages()
    {
      let backGroundName = totalTeamInfoArray[i!].teamBackgroundval
        let captainImageName = totalTeamInfoArray[i!].teamCaptainImageval
        let groundImageName = totalTeamInfoArray[i!].teamGroundval
        print("************",backGroundName!)
        print("************",captainImageName!)
        print("************",groundImageName!)
        teamInfoControllerVar?.fetchImageFromServices(backGroundName: backGroundName!,captainImageName:captainImageName!,groundImageName:groundImageName!)
        
        
    }
    
    
    func sendImagetoView(teamBackground:UIImage,teamCaptain:UIImage,groundImage:UIImage)
    {
        teamBackgroundImage.append(teamBackground)
        teamCaptainImage.append(teamCaptain)
        teamGroundImage.append(groundImage)
        
        backGroundImageCount = teamBackgroundImage.count
        captainImageCount = teamCaptainImage.count
        groundImageCount = teamGroundImage.count
            
        if backGroundImageCount<totalTeamInfoArray.count || captainImageCount<totalTeamInfoArray.count || groundImageCount<totalTeamInfoArray.count {
            
            self.fetchImages()
            
        }
        
        else {
            totalteamBackgroundImage = teamBackgroundImage
            totalteamCaptainImage = teamCaptainImage
            totalteamGroundImage = teamGroundImage
            teamViewControllerVar?.setTeamInfo()
        
        }
        
    }

    
}
