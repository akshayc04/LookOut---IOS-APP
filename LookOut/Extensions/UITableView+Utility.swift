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
  
    static var cellIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: CellIdentifiable { }

extension UITableView {
    
    func dequeueReusableCell<T>() -> T where T: CellIdentifiable {
    
        guard let cell = dequeueReusableCell(withIdentifier: T.cellIdentifier) as? T else {
       
            fatalError("Error dequeuing cell for identifier \(T.cellIdentifier)")
        }
        
        return cell
    }
}
