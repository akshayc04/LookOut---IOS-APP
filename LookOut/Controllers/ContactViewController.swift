//
//  ContactViewController.swift
//  LookOut
//
//  Created by Akshay on 4/4/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var DPSbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Important Contacts"
        // Do any additional setup after loading the view.
    }

    @IBAction func DPSbtnTapped(_ sender: Any) {
        
        let num1:String = "3159498601"
        let url = URL(string:"teleprompt://\(num1)")
        print(url!)
        UIApplication.shared.open(url!)
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
