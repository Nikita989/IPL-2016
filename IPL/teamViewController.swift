
//
//  teamViewController.swift
//  IPL
//
//  Created by BridgeLabz Solution LLP on 23/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class teamViewController: UIViewController {

    @IBOutlet weak var teamGroundImage: UIImageView!
    @IBOutlet weak var teamCaptainLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamCoachLabel: UILabel!
    @IBOutlet weak var teamCaptainImage: UIImageView!
    @IBOutlet weak var homeVenueLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var teamBackgroundImage: UIImageView!
    
    
    var count:Int?
    var rowIndex:Int?
    var teamInfoModelVar:teamInfoModel?
    var teamNamevar:String?
    
    @IBOutlet weak var imageIndicator: UIActivityIndicatorView!
   
    @IBOutlet weak var viewPlayerButton: UIButton!
    

        override func viewDidLoad() { 
        super.viewDidLoad()
            imageIndicator.startAnimating()
            
            
        teamInfoModelVar = teamInfoModel()
        teamInfoModelVar?.teamViewControllerVar=self
        teamInfoModelVar?.i = rowIndex
        if teamInfoModelVar?.totalTeamInfoArray.count == 0 {
        self.teamInfoModelVar?.fetchTeamInfoFromController()
       
        }
        
        else {
            self.setTeamInfo()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let teamView = segue.destination as! PlayersViewController
        teamView.teamName = teamNamevar
        teamView.indexPressed = rowIndex
        
        
    }


    func setTeamInfo()
    {
        let teamInfoData = teamInfoModelVar?.totalTeamInfoArray[rowIndex!]
        teamNamevar = teamInfoData?.teamNameval
        imageIndicator.stopAnimating()
       
        teamCaptainLabel.text = teamInfoData?.teamCaptainval
        teamNameLabel.text = teamInfoData?.teamNameval
        teamCoachLabel.text = teamInfoData?.teamCoachval
        homeVenueLabel.text = teamInfoData?.teamHomeVenueval
        ownerLabel.text = teamInfoData?.teamOwnerval
        
        
        let teamImage1 = teamInfoModelVar?.totalteamBackgroundImage[rowIndex!]
        
        teamBackgroundImage.image = teamImage1
        
        
        let teamImage2 = teamInfoModelVar?.totalteamGroundImage[rowIndex!]
        
        teamGroundImage.image = teamImage2
        
        
        let teamImage3 = teamInfoModelVar?.totalteamCaptainImage[rowIndex!]
        
        teamCaptainImage.image = teamImage3
        
        self.viewPlayerButton.isHidden = false

        
    }
    

}


