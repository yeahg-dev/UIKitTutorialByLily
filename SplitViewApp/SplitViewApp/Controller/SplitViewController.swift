//
//  SplitViewController.swift
//  SplitViewApp
//
//  Created by 1 on 2022/02/13.
//

import UIKit

class SplitViewController: UISplitViewController {
    let tableViewController: UIViewController = TableViewController()
    
    override func viewDidLoad() {
        setViewController(tableViewController, for: .primary)
    }

}
