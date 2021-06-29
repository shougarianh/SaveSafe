//
//  SignUpViewController.swift
//  SaveSafe
//
//  Created by Haik Shougarian on 6/14/21.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var FirstNameTextField: UITextField!
    
    
    @IBOutlet weak var LastNameTextField: UITextField!
    
    @IBOutlet weak var EmailTextField:
        UITextField!
    
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    
  
    @IBOutlet weak var SignUpButton:
        UIButton!
    
    
    @IBOutlet weak var ErrorButton:
        UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements()
    {
        // hide the error label
        ErrorButton.alpha = 0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    // check the fields and validate that data is correct
    
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    
    // return nil if everything is correct
    func validateFields() -> String? {
        // check that all fields are filled in
        if FirstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                LastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                EmailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
                PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields"
        }
        // check if password is valid
        
        let cleanedPassword = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if (isPasswordValid(cleanedPassword) == false)
        {
            return "Your password must contain atleast 8 characters, a special character, and a number"
        }
        return nil
    }
    
   
    
    @IBAction func SignUpButtonTap(_ sender: Any) {
        let error = validateFields()
        if error != nil
        {
            // theres something wronf with fields show error message
            ErrorButton.text = error!
            ErrorButton.alpha = 1
        }
        else{
        // create cleaned version of data
            let firstname = FirstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastname = LastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = EmailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = PasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        // create the user
            Auth.auth().createUser(withEmail: email, password: password) { result, err in
                //check for errors
                if err != nil {
                    // there was an error
                    self.ErrorButton.text = "Error creating user"
                    self.ErrorButton.alpha = 1
                }
                else
                {
                    // user was created succesfully, store first and last names
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstname":firstname,"lastname":lastname,"uid": result!.user.uid]) { (error) in
                        if error != nil
                        {
                            //there was an error
                            self.ErrorButton.text = "Error creating user 1"
                            self.ErrorButton.alpha = 1
                        }
                    }
                }
            }
        // transition to home screen
            self.transitionToHome()
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
