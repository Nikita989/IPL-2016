//
//  playerInfoModel.swift
//  IPL
//
//  Created by BridgeLabz Solution LLP on 26/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class playerInfoModel: NSObject {

    var name:String?
    var role:String?
    var nationality:String?
    var batting:String?
    var bowling:String?
    var dob:String?
    var imageName:String?
    
     init(Name:String,Role:String,Nationality:String,Batting:String,Bowling:String,DOB:String?,ImageName:String) {
        self.name = Name
        self.role = Role
        self.nationality = Nationality
        self.batting = Batting
        self.bowling = Bowling
        self.dob = DOB
        self.imageName = ImageName
        
        
    }
    
}
