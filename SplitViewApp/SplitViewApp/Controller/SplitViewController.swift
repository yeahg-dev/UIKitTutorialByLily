//
//  SplitViewController.swift
//  SplitViewApp
//
//  Created by 1 on 2022/02/13.
//

import UIKit

class SplitViewController: UISplitViewController {
    let tableViewController: TableViewController = TableViewController()
    let textViewController: TextViewController = TextViewController()
    var animalManager: AnimalManager = AnimalManager()
    
    override func viewDidLoad() {
        tableViewController.dataSource = self
        setViewController(tableViewController, for: .primary)
        setViewController(textViewController, for: .secondary)
    }
}

extension SplitViewController: TableViewControllerDataSource {
    func tableViewController(_ viewController: TableViewController,
                             numbersOfSection: Int
    ) -> Int {
        return animalManager.animals.count
    }
    
    func tableViewController(_ viewController: TableViewController,
                             rowForAnimal indexPath: IndexPath
    ) -> Animal {
        return animalManager.animals[indexPath.row]
    }
    
    func tableViewController(_ viewController: TableViewController,
                             rowForDelete indexPath: IndexPath
    ) {
        animalManager.delete(at: indexPath.row)
    }
}
