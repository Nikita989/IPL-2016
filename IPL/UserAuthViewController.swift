//
//  UserAuthViewController.swift
//  IPL
//
//  Created by BridgeLabz Solution LLP on 22/11/16.
//  Copyright © 2016 BridgeLabz Solution LLP. All rights reserved.
//

import UIKit
import Firebase
class UserAuthViewController: UIViewController,CAAnimationDelegate{

    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var userEmail: UITextField!
    
    @IBOutlet var secondView: UIView!
    @IBOutlet weak var iplImage: UIImageView!
    @IBOutlet weak var userPassword: UITextField!
    
    @IBOutlet weak var signInOutlet: UIButton!
    
    @IBOutlet weak var signupOutlet: UIButton!
    
//    
//    var mask:CALayer?
//    var animation:CABasicAnimation?
//    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.animateLaunch(image: UIImage(named: "background")!)
        signInOutlet.transform = CGAffineTransform(translationX: 0, y: 450)
        signupOutlet.transform = CGAffineTransform(translationX: 0, y: 450)
        
        UIView.animate(withDuration: 2.2, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .curveEaseIn, animations:
            {
               self.signupOutlet.transform = CGAffineTransform(translationX: 0, y: 0)
                
        }, completion: nil)
        
        
        
        
       
        UIView.animate(withDuration: 2.2, delay: 0.5, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .curveEaseIn, animations:
            {
             self.signInOutlet.transform = CGAffineTransform(translationX: 0, y: 0)
                
        }, completion: nil)
        
        // Do any additional setup after loading the view.
    }

    
//    func animateLaunch(image:UIImage)
//    {
//        mask = CALayer()
//        mask?.contents = image.cgImage
//        mask?.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
//        mask?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
//        mask?.position = CGPoint(x: secondView.frame.width/2.0, y: secondView.frame.height)
//        secondView.layer.mask = mask
//        animateDecreaseSize()
//    }
//    
//    func animateDecreaseSize()
//    {
//        let decreseSize = CABasicAnimation(keyPath: "bounds")
//        decreseSize.delegate = self
//        decreseSize.duration = 1.0
//        decreseSize.fromValue = NSValue(cgRect : mask!.bounds)
//        decreseSize.toValue = NSValue(cgRect: CGRect(x: 0, y: 0, width: 80, height: 80))
//        
//        
//        decreseSize.fillMode = kCAFillModeForwards
//        decreseSize.isRemovedOnCompletion = false
//        
//        mask?.add(decreseSize, forKey: "bounds")
//       
//    }
//    
//    func animationDidStop(_ anim: CAAnimation, finished flag: Bool)
//    {
//      animateIncreaseSize()
//     }
//
//    
//    func animateIncreaseSize()
//    {
//         animation = CABasicAnimation(keyPath: "bounds")
//       
//        animation?.duration = 1.0
//        animation?.fromValue = NSValue(cgRect : mask!.bounds)
//        animation?.toValue = NSValue(cgRect: CGRect(x: 0, y: 0, width: 4000, height: 4000))
//        
//        
//        animation?.fillMode = kCAFillModeForwards
//        animation?.isRemovedOnCompletion = false
//        
//        mask?.add(animation!, forKey: "bounds")
//        UIView.animate(withDuration: 1.0, animations:{
//            
//            self.firstView.alpha = 0
//        
//        } )
//        
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
       
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func createUser(_ sender: UIButton) {
        
        FIRAuth.auth()?.createUser(withEmail: userEmail.text!, password: userPassword.text!, completion: {
            user,error in
            
              if let error2 = error
            {
               
                let title = "Invalid Email/Password"
                let message = "Enter valid Email and Password"
                let okText = "OK"
                
                let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
                
                let okayButton = UIAlertAction.init(title: okText, style: UIAlertActionStyle.cancel, handler: nil)
                
                alert.addAction(okayButton)
               self.present(alert, animated: true, completion: nil)
                
            }
            else{
                
                print("user created")
                //self.login()
               self.performSegue(withIdentifier:"teamsSegue", sender: nil)
                
            }
        
        
        })
        
    }
    
    
    
    @IBAction func signInUser(_ sender: UIButton) {
        
        FIRAuth.auth()?.signIn(withEmail: userEmail.text!, password: userPassword.text!, completion: {
            (user,error) in
            if error != nil
            {
                let title = "Invalid Email/Password"
                let message = "Enter valid Email and Password"
                let okText = "OK"
                
                let alert = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
                
                let okayButton = UIAlertAction.init(title: okText, style: UIAlertActionStyle.cancel, handler: nil)
                
                alert.addAction(okayButton)
                self.present(alert, animated: true, completion: nil)
                
            }
            else{
                
                print("user created")
                
                self.performSegue(withIdentifier:"teamsSegue", sender: nil)
                
            }
            
            
        })

        
        
        
    }
    
//    func login()
//    {
//        FIRAuth.auth()?.createUser(withEmail: userEmail.text!, password: userPassword.text!, completion: {
//        
//            user,error in
//            
//            if error != nil
//            {
//                
//                print("error creating")
//                
//            }
//            
//            else
//            {
//                
//                print("successfull")
//                
//               
//            }
//        
//        })
//        
    }
   


