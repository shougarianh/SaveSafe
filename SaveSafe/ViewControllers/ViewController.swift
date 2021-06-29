//
//  ViewController.swift
//  SaveSafe
//
//  Created by Haik Shougarian on 6/14/21.
//

import UIKit
//import FBSDKLoginKit

// Add this to the body
class ViewController: UIViewController {
    
    @IBOutlet weak var SignUpButton:
        UIButton!
    
    
    @IBOutlet weak var LoginButton:
        UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        if let token = AccessToken.current,
               !token.isExpired {
               // User is logged in, do work such as go to next view controller.
        }
        else
        {
            let loginButton = FBLoginButton()
            loginButton.center = view.center
            //loginButton.delegate = self
            loginButton.permissions = ["public_profile", "email"]
            view.addSubview(loginButton)
        }
 */
    }
 
}
