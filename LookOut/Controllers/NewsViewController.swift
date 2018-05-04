//
//  NewsViewController.swift
//  LookOut
//
//  Created by Akshay on 4/22/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit
import WebKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    let Url = URL(string: "https://news.syr.edu/sections/")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let request = URLRequest(url: Url!)
        webView.load(request)
        
    }

}
