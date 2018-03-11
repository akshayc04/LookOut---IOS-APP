//
//  UITableView+Utility.swift
//  LookOut
//
//  Created by Akshay on 3/10/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import Foundation
import UIKit

protocol CellIdentifiable {
    static var cellIdentifier: String { get }
}

extension CellIdentifiable where Self: UITableViewCell {
    // 2
    static var cellIdentifier: String {
        return String(describing: self)
    }
}

// 3
extension UITableViewCell: CellIdentifiable { }

extension UITableView {
    
    func dequeueReusableCell<T>() -> T where T: CellIdentifiable {
        // 2
        guard let cell = dequeueReusableCell(withIdentifier: T.cellIdentifier) as? T else {
            // 3
            fatalError("Error dequeuing cell for identifier \(T.cellIdentifier)")
        }
        
        return cell
    }
}
