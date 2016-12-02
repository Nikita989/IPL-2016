//
//  PlayerInfoView.swift
//  IPL
//
//  Created by BridgeLabz Solution LLP on 26/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class PlayerInfoView: UIViewController {

    
    @IBOutlet weak var playerImage: UIImageView!
    
    @IBOutlet weak var playerNameLabel: UILabel!
    
    @IBOutlet weak var battingStyleLabel: UILabel!
    @IBOutlet weak var playerRoleLabel: UILabel!
    
    @IBOutlet weak var nationalityLabel: UILabel!
    @IBOutlet weak var bowlingStyleLabel: UILabel!
    @IBOutlet weak var playerDOBLabel: UILabel!
    
    @IBOutlet weak var imageIndicator: UIActivityIndicatorView!
    
    var selectedIndex:Int?
    var teamName:String?
    var playerViewModelVar:playerViewModel?
    var imageASD:CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageIndicator.startAnimating()
        imageASD = playerImage.center
//        playerImage.frame = CGRect(x: 0, y: 0, width: playerImage.bounds.size.width, height: playerImage.bounds.size.height)
        playerViewModelVar = playerViewModel()
        playerViewModelVar?.playerInfoViewVar = self
        playerViewModelVar?.fetchInfoFromController(index: selectedIndex!,teamName: teamName!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setInfo()
    {
        
          let teamInfo = playerViewModelVar?.details
        imageIndicator.stopAnimating()
             battingStyleLabel.text = teamInfo?.batting
             bowlingStyleLabel.text = teamInfo?.bowling
             playerDOBLabel.text = teamInfo?.dob
             nationalityLabel.text = teamInfo?.nationality
             playerRoleLabel.text = teamInfo?.role
             playerNameLabel.text = teamInfo?.name
        playerImage.image = playerViewModelVar?.playerimage
        
       // let tableWidth = playerImage.bounds.size.width
        self.playerImage.transform = CGAffineTransform(translationX: -100, y: -100)

        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseIn, animations: { () -> Void in
            
            self.playerImage.transform = CGAffineTransform(translationX: 0, y: 0)
                       //self.playerImage.alpha = 1
            
        }, completion: nil )
    }

}
