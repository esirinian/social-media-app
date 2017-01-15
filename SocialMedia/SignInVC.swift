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
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        let fbLoginBtn = FBSDKLoginManager()
        
        fbLoginBtn.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Unable to authenticate with FACEBOOK!")
            } else if result?.isCancelled == true {
                print("User cancelled FB Authenification")
            } else {
                print ("AUthenificated")
                let credential = FIRGitHubAuthProvider.credential(withToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ crendential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: crendential, completion: { (user, error) in
            if error != nil {
                print("UNable to auth with Firbase - \(error)")
            } else {
                print("Success auth with FIREBASE")
            }
        })
    }

}





