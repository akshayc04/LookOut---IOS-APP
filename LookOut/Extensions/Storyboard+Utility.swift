//
//  Storyboard+Utility.swift
//  LookOut
//
//  Created by Akshay on 3/6/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import Foundation

import UIKit

extension UIStoryboard {
    enum LOType: String {
        case main
        case login
        
        var filename: String {
            return rawValue.capitalized
        }
    }
    convenience init(type: LOType, bundle: Bundle? = nil) {
        self.init(name: type.filename, bundle: bundle)
    }
    static func initialViewController(for type: LOType) -> UIViewController {
        let storyboard = UIStoryboard(type: type)
        guard let initialViewController = storyboard.instantiateInitialViewController() else {
            fatalError("Couldn't instantiate initial view controller for \(type.filename) storyboard.")
        }
        
        return initialViewController
    }
}
