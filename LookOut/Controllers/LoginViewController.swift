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

        // Do any additional setup after loading the view.
    }

    @IBAction func loginBtn(_ sender: UIButton) {
        print("Login button tapped")
        guard let authUI = FUIAuth.defaultAuthUI()
            else { return }
        
        authUI.delegate = self
        
        // add google provider
        let providers: [FUIAuthProvider] = [FUIGoogleAuth()]
        authUI.providers = providers
        
        let authViewController = authUI.authViewController()
        present(authViewController, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
typealias FIRUser = FirebaseAuth.User
extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: FIRUser?, error: Error?) {
        if let error = error {
            assertionFailure("Error signing in: \(error.localizedDescription)")
            return
        }
        // 1
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
