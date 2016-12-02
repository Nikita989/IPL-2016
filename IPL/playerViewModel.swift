//
//  playerViewModel.swift
//  IPL
//
//  Created by BridgeLabz Solution LLP on 26/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class playerViewModel: NSObject {

    var playerInfoViewVar:PlayerInfoView?
    var playerInfoControllerVar:playerInfoController?
    var selectedIndex:Int?
    var TeamNameVar:String?
    var details:playerInfoModel?
    var playerimage:UIImage?
    func fetchInfoFromController(index:Int,teamName:String)
    {
        selectedIndex = index
        TeamNameVar = teamName
        playerInfoControllerVar = playerInfoController()
        playerInfoControllerVar?.playerViewModelVar = self
        playerInfoControllerVar?.fetchInfoFromServices(Index:index,TeamName:teamName)
        
    }
    
    
    func sendArrToView(array:playerInfoModel?)
    {
        if array == nil{
            
            playerInfoControllerVar?.fetchInfoFromServices(Index:selectedIndex!,TeamName:TeamNameVar!)
        }
        
        else
        {
            details = array
            
            self.fetchImage()
            
        }
        
        
    }
    
    func fetchImage()
    {
      let imageName = details?.imageName
        print("***************",imageName!)
        playerInfoControllerVar?.FetchImageFromServices(imageName: imageName!)
        
    }
    
    func sendImagetoView(image:UIImage)
    {
        
        playerimage = image
        playerInfoViewVar?.setInfo()
    }
}
