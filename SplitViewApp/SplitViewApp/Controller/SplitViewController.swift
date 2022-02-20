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
    var selectedIndexPath: IndexPath = IndexPath(row: .zero, section: .zero)
    
    override func viewDidLoad() {
        tableViewController.dataSource = self
        tableViewController.delegate = self
        textViewController.delegate = self
        setViewController(tableViewController, for: .primary)
        setViewController(textViewController, for: .secondary)
        preferredDisplayMode = .twoBesideSecondary
        preferredSplitBehavior = .tile
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
                             rowForDelete inedexPath: IndexPath
    ) {
        animalManager.delete(at: inedexPath.row)
    }
}

extension SplitViewController: TableViewControllerDelegate {
    func tableViewController(_ viewController: TableViewController,
                             didSelectRow indexPath: IndexPath
    ) {
        let description = animalManager.animals[indexPath.row].description
        textViewController.updateTextViewContent(with: description)
        selectedIndexPath = indexPath
    }
}

extension SplitViewController: TextViewControllerDelegate {
    func textViewController(_ viewController: TextViewController,
                            didChangeTextView string: String?
    ) {
        animalManager.update(at: selectedIndexPath.row, with: string)
    }
}
