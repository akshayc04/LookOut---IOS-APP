//
//  CustomAuthView.swift
//  LookOut
//
//  Created by Akshay on 4/20/18.
//  Copyright © 2018 Akshay. All rights reserved.
//
import UIKit
import FirebaseAuthUI

class CustomAuthView: FUIAuthPickerViewController {
    
    
    override init(nibName: String?, bundle: Bundle?, authUI: FUIAuth) {
        super.init(nibName: "FUIAuthPickerViewController", bundle: bundle, authUI: authUI)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = #imageLiteral(resourceName: "wallpaper")
        // you can change the content mode:
        imageViewBackground.contentMode = UIViewContentMode.scaleAspectFill
        
        view.insertSubview(imageViewBackground, at: 0)
        
    }
    
}
