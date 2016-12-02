//
//  ViewController.swift
//  IPL
//
//  Created by BridgeLabz Solution LLP on 21/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var teamCollectionView: UICollectionView!
       
    var viewModelobj:teamModel?
    var teamArray:[teams] = []
    var count = 0
    var i:Int = 0
    var selectedIndex:Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        teamCollectionView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        viewModelobj = teamModel()
        viewModelobj?.viewobj = self
        teamCollectionView.dataSource=self
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var indexpath:IndexPath?
        
        indexpath = teamCollectionView.indexPathsForSelectedItems![0]
        
        let teamView = segue.destination as! teamViewController
        let cellIndex = indexpath?.row
        teamView.rowIndex = cellIndex!
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func reload()
    {
        
        teamCollectionView.reloadData()
        
        
    }
    
   
}


extension ViewController : UICollectionViewDataSource
{
    
    
    func numberOfSections(in collectionView: UICollectionView)-> Int {
        
        return 1
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
        if i==0
        {
            (viewModelobj?.checkCount())!
            i+=1
        }
        
        return (viewModelobj?.count)!
    }
    
    
        
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)-> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamcell",for:indexPath) as! teamCollectionViewCell
        
        
        
        cell.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        
               let teamName:String = (viewModelobj?.Teamarray[indexPath.row].teamName)!
        let teamLogo:UIImage = (viewModelobj?.TeamImageArray[indexPath.row])!
//        cell.teamNameLabel.text = teamName
        cell.teamImageView.image = teamLogo
        UIView.animate(withDuration: 1.4
            
            
            , animations: {
        cell.transform = CGAffineTransform(scaleX: 1, y: 1)
            
        }, completion: nil)
        
        return cell
    }
    
    
}

extension ViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
 
      let selectedIndex = indexPath
        print("kkkkkkkkkkkkkkkkkk",selectedIndex)
        self.performSegue(withIdentifier:"teamInformationSegue", sender: nil)

}

}



