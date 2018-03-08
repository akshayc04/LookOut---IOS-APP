//
//  UIImage+Size.swift
//  LookOut
//
//  Created by Akshay on 3/7/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    var aspectHeight: CGFloat {
        let heightRatio = size.height / 736
        let widthRatio = size.width / 414
        let aspectRatio = fmax(heightRatio, widthRatio)
        
        return size.height / aspectRatio
    }
}
