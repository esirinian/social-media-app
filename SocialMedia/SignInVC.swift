//
//  SignInVC.swift
//  SocialMedia
//
//  Created by Eric Sirinian on 1/14/17.
//  Copyright © 2017 Eric Sirinian. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    @IBOutlet weak var signInBtn: CustomButtonSI!
    @IBOutlet weak var fbBtn: CustomButtonFB!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    

    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        UIView.animate(withDuration: 0.05, animations: {
            self.fbBtn.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: { _ in
            UIView.animate(withDuration: 0.05) {
                self.fbBtn.transform = CGAffineTransform.identity
            }
        })
        
        
        let fbLoginBtn = FBSDKLoginManager()
        fbLoginBtn.logOut()
        
        fbLoginBtn.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Unable to authenticate with FACEBOOK! - \(error!)")
            } else if result?.isCancelled == true {
                print("User cancelled FB Authenification")
            } else {
                print ("FB Authenificated")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ crendential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: crendential, completion: { (user, error) in
            if error != nil {
                print("Unable to authentificate with Firebase using FB")
            } else {
                print("Successful authentification with Firebase")
            }
        })
    }

    @IBAction func signInTapped(_ sender: Any) {
        
        UIView.animate(withDuration: 0.05, animations: {
            self.signInBtn.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: { _ in
            UIView.animate(withDuration: 0.05) {
                self.signInBtn.transform = CGAffineTransform.identity
            }
        })
        
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print("Email Authentificated")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            print("Unable to authentificate with Firebase using email")
                        } else {
                            print("Successful authentification with Firebase")
                        }
                    })
                }
            })
        }
    }
    
    
    
    
    
    
}





