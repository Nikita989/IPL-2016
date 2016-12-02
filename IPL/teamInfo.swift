//
//  teamInfo.swift
//  IPL
//
//  Created by BridgeLabz Solution LLP on 23/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class teamInfo: NSObject {

    var teamBackgroundval : String?
    var teamCaptainval: String?
    var teamCoachval: String?
    var teamGroundval: String?
    var teamHomeVenueval: String?
    var teamCaptainImageval: String?
    var teamNameval: String?
    var teamOwnerval: String?
   
    
    init(teamBackgroundval:String?,teamCaptainval:String?,teamCoachval:String?,teamGroundval:String?,teamHomeVenueval:String?,teamCaptainImageval:String?,teamNameval:String?,teamOwnerval:String?) {
        
       self.teamBackgroundval=teamBackgroundval
        self.teamCaptainval=teamCaptainval
        self.teamCoachval=teamCoachval
        self.teamGroundval=teamGroundval
        self.teamHomeVenueval=teamHomeVenueval
        self.teamCaptainImageval=teamCaptainImageval
        self.teamNameval=teamNameval
        self.teamOwnerval=teamOwnerval
    
        
    }

}
