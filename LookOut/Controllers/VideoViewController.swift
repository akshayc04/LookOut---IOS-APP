//
//  VideoViewController.swift
//  LookOut
//
//  Created by Akshay on 4/28/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit

import YouTubePlayer
import WebKit

class VideoViewController: UIViewController {
    
  
    let videoplayer: YouTubePlayerView = YouTubePlayerView()
    let videoplayer1: YouTubePlayerView = YouTubePlayerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        self.view.addSubview(videoplayer)
        self.view.addSubview(videoplayer1)
         setupviews()
        
    }
    
    func setupviews(){
        
        videoplayer.translatesAutoresizingMaskIntoConstraints =  false
        videoplayer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        videoplayer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        videoplayer.widthAnchor.constraint(equalToConstant: 400).isActive = true
        videoplayer.heightAnchor.constraint(equalToConstant: 250).isActive = true
        videoplayer.loadPlaylistID("PLllVtrIRwPHcjMa8DGzJKZQOGu8Zh8RDv")
        
        videoplayer1.translatesAutoresizingMaskIntoConstraints =  false
        videoplayer1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        videoplayer1.topAnchor.constraint(equalTo: videoplayer.bottomAnchor, constant: 20).isActive = true
        videoplayer1.widthAnchor.constraint(equalToConstant: 400).isActive = true
        videoplayer1.heightAnchor.constraint(equalToConstant: 250).isActive = true
        videoplayer1.loadPlaylistID("PLGlgqeWpR7YX7OGUVAS5u7QY9yrj-IOTJ")
    }
    
        
}
