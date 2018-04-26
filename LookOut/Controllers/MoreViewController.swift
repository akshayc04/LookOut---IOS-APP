//
//  MoreViewController.swift
//  LookOut
//
//  Created by Akshay on 3/22/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    @IBOutlet weak var newsBtn: UIButton!
    @IBOutlet weak var contactBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newsBtn.layer.cornerRadius = 15
        contactBtn.layer.cornerRadius = 15
       
    }

 
}
