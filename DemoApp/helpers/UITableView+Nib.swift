//
//  UITableView+Nib.swift
//  DemoApp
//
//  Created by Kid Kid on 12/12/22.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(nibCell: T.Type) {
      register(T.nib(), forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func register<T: UITableViewCell>(nibCell: T.Type, for identifier: String) {
      register(T.nib(), forCellReuseIdentifier: identifier)
    }
    
    func dequeue<T: UITableViewCell>(cell: T.Type, at indexPath: IndexPath) -> T {
      return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    func dequeue<T: UITableViewCell>(cell: T.Type, at indexPath: IndexPath, for identifier: String) -> T {
      if let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T {
        return cell
      }
        
      fatalError("Cell not identifier \(identifier)")
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(nibView: T.Type) {
      register(T.nib(), forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueHeaderFooter<T: UITableViewHeaderFooterView>(view: T.Type) -> T {
      return dequeueReusableHeaderFooterView(withIdentifier: T.reuseIdentifier) as! T
    }
}
