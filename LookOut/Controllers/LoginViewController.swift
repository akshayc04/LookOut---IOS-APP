//
//  LoginViewController.swift
//  LookOut
//
//  Created by Akshay on 3/4/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit
import UIKit
import FirebaseAuth
import FirebaseAuthUI
import FirebaseDatabase
import FirebaseGoogleAuthUI


class LoginViewController: UIViewController {

    @IBOutlet weak var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "wallpaper"))
        login.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }

    @IBAction func loginBtn(_ sender: UIButton) {
        print("Login button tapped")
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        authUI.delegate = self
        
        let providers: [FUIAuthProvider] = [FUIGoogleAuth()]
        authUI.providers = providers
        
        let authViewController = CustomAuthView(authUI: authUI)
        let navc = UINavigationController(rootViewController: authViewController)
        present(navc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
typealias FIRUser = FirebaseAuth.User
extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
       
        guard let user = user
            else { return }
        
        UserService.show(forUID: user.uid) { (user) in
            if let user = user {
                // handle existing user
                
                 User.setCurrent(user, writeToUserDefaults: true)
                
                let initialViewController = UIStoryboard.initialViewController(for: .main)
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
            } else {
                // handle new user
                self.performSegue(withIdentifier: Constants.Segue.toCreateUsername, sender: self)
            }
        }
    }
    
    
    
    
}
