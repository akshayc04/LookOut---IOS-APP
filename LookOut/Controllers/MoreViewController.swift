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
    @IBOutlet weak var mapsBtn: UIButton!
    @IBOutlet weak var videoBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newsBtn.layer.cornerRadius = 15
        newsBtn.layer.borderWidth = 1
        newsBtn.layer.borderColor = UIColor.black.cgColor
        
        contactBtn.layer.cornerRadius = 15
        contactBtn.layer.borderWidth = 1
        contactBtn.layer.borderColor = UIColor.black.cgColor
        
        mapsBtn.layer.cornerRadius = 15
        mapsBtn.layer.borderWidth = 1
        mapsBtn.layer.borderColor = UIColor.black.cgColor
        
        videoBtn.layer.cornerRadius = 15
        videoBtn.layer.borderWidth = 1
        videoBtn.layer.borderColor = UIColor.black.cgColor
       
    }

 
}
