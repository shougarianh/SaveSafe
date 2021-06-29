//
//  LoginViewController.swift
//  SaveSafe
//
//  Created by Haik Shougarian on 6/14/21.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var UsernameTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
    @IBOutlet weak var LoginButton:
        UIButton!
    
    
    @IBOutlet weak var Error:
        UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements()
    {
        // hide the error label
        Error.alpha = 0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func LoginTapped(_ sender: Any) {
        // validate all text fields
        
        
        let email = UsernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        // sign in the user
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil
            {
                self.Error.text = error!.localizedDescription
                self.Error.alpha = 1
            }
            else{
                self.transitionToHome()
            }
        }
    }
    func transitionToHome()
    {
        let homeViewController =
            storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as?
            HomeViewController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
}
