//
//  UITableView+Extension.swift
//  SplitViewApp
//
//  Created by 1 on 2022/02/13.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(cellWithClass name: T.Type) {
            register(T.self, forCellReuseIdentifier: String(describing: name))
        }
    
    func dequeueReusableCell<T: UITableViewCell>(
        withClass name: T.Type,
        for indexPath: IndexPath
    ) -> T {
           guard let cell = dequeueReusableCell(
            withIdentifier: String(describing: name),
            for: indexPath
           ) as? T else {
               fatalError(
                   "Couldn't find UITableViewCell for \(String(describing: name)), make sure the cell is registered with table view")
           }
           return cell
       }
}
