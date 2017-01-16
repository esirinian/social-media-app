//
//  SignInVC.swift
//  SocialMedia
//
//  Created by Eric Sirinian on 1/14/17.
//  Copyright © 2017 Eric Sirinian. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit
import SwiftKeychainWrapper


class SignInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    @IBOutlet weak var signInBtn: CustomButtonSI!
    @IBOutlet weak var fbBtn: CustomButtonFB!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            print("ID found in Keychain!")
            performSegue(withIdentifier: "toFeedVC", sender: nil)
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    

    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        self.animateBtn(btn: fbBtn)
        
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
                print("Unable to authentificate with Firebase")
            } else {
                print("Successful authentification with Firebase")
                if let user = user {
                    let userData = ["provider": crendential.provider]
                    self.autoSignIn(id: user.uid, userData: userData)
                }
                
            }
        })
    }

    @IBAction func signInTapped(_ sender: Any) {
        
       self.animateBtn(btn: signInBtn)
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print("Email Authentificated")
                    
                    if let user = user {
                        let userData = ["provider": user.providerID]
                        self.autoSignIn(id: user.uid, userData: userData)
                    }
                    
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            print("Unable to authentificate with Firebase using email")
                        } else {
                            print("Successful authentification with Firebase")
                            
                            if let user = user {
                                let userData = ["provider": user.providerID]
                                self.autoSignIn(id: user.uid, userData: userData)
                            }
                        }
                    })
                }
            })
        }
    }
    
    func autoSignIn (id: String, userData: Dictionary<String, String>) {
        
        DataService.ds.createFirebaseDBUser(uid: id, userData: userData)
        
        let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        performSegue(withIdentifier: "toFeedVC", sender: nil)
        
        print("Data saved to keychain \(keychainResult)")
        
    }
    
    func animateBtn(btn: UIButton) {
        
        UIView.animate(withDuration: 0.05, animations: {
            btn.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: { _ in
            UIView.animate(withDuration: 0.05) {
                btn.transform = CGAffineTransform.identity
            }
        })
        
    }
    
    
    
    
}





