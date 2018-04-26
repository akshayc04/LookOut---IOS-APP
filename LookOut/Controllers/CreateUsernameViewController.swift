//
//  CreateUsernameViewController.swift
//  LookOut
//
//  Created by Akshay on 3/6/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit
import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController {

    @IBOutlet weak var UserName: UITextField!
    @IBOutlet weak var Next: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            Next.layer.cornerRadius = 20
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "wallpaper"))
        // Do any additional setup after loading the view.
    }

    @IBAction func NextBtn(_ sender: UIButton) {
        guard let firUser = Auth.auth().currentUser,
            let username = UserName.text,
            !username.isEmpty else { return }
        
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else {
                // handle error
                return
            }
            
            User.setCurrent(user, writeToUserDefaults: true)
            
            let initialViewController = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
        
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
