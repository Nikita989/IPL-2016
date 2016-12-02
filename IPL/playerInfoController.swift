//
//  playerInfoController.swift
//  IPL
//
//  Created by BridgeLabz Solution LLP on 26/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class playerInfoController: NSObject {
    
    var playerViewModelVar:playerViewModel?
    var playerInfoServicesVar:playerInfoServices?
    
    func fetchInfoFromServices(Index:Int,TeamName:String)
    {
        playerInfoServicesVar = playerInfoServices()
        playerInfoServicesVar?.playerInoControllerVar = self
        playerInfoServicesVar?.fetchInfoFromDatabase(selectedIndex: Index, name: TeamName)
        
    }
    
    func sendArrayToViewModel(array1:playerInfoModel)
    {
        playerViewModelVar?.sendArrToView(array: array1)
        
    }
    
    func FetchImageFromServices(imageName:String)
    {
        playerInfoServicesVar?.fetchPlayerImagefromDatabase(imageName: imageName)
        
    }
    
    
    func sendImageViewModel(image:UIImage)
    {
        playerViewModelVar?.sendImagetoView(image: image)
        
    }
}
