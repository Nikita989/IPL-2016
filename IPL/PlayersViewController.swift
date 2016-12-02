//
//  PlayersViewController.swift
//  IPL
//
//  Created by BridgeLabz Solution LLP on 24/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {

    @IBOutlet weak var teamLogoImage: UIImageView!
    
    @IBOutlet weak var playersCollectionView: UICollectionView!
    
    
    var teamName:String?
    var indexPressed:Int?
    var teamPlayersViewModelVar:teamPlayersViewModel?
    var i:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamPlayersViewModelVar = teamPlayersViewModel()
        teamPlayersViewModelVar?.playersViewControllervar = self
        playersCollectionView.dataSource = self
         print("***************",teamName!)
        teamPlayersViewModelVar?.clickedIndex = indexPressed
       (teamPlayersViewModelVar?.checkCount(teamName: teamName!))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var indexpath:IndexPath?
        indexpath = playersCollectionView.indexPathsForSelectedItems![0]
        let teamView = segue.destination as! PlayerInfoView
        let cellIndex = indexpath?.row
        teamView.selectedIndex = cellIndex!
        teamView.teamName = teamName
        
    }

    
    func reload()
    {
        
        playersCollectionView.reloadData()
        self.setImage()
        
    }
    
    func setImage()
    {
        teamLogoImage.image = teamPlayersViewModelVar?.logoImage
        
    }


}

extension PlayersViewController : UICollectionViewDataSource
{
    
    
    func numberOfSections(in collectionView: UICollectionView)-> Int {
        
        return 1
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
      
        return (teamPlayersViewModelVar?.count)!
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)-> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "playerCell",for:indexPath) as! playersCollectionViewCell
        
        
        
        let teamName:String = (teamPlayersViewModelVar?.totalPlayerArr[indexPath.row])!
        cell.playerNameLabel.text = teamName

        
        return cell
    }
   
}

extension PlayersViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCell = indexPath
        print("kkkkkkkkkkkkkkkkkk",selectedCell)
        self.performSegue(withIdentifier:"playerInfoSegue", sender: nil)
        
}
}


