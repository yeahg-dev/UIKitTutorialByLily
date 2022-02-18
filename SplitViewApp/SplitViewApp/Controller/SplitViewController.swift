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
        tableViewController.tableView.dataSource = self
        tableViewController.dataSource = self
        setViewController(tableViewController, for: .primary)
        setViewController(textViewController, for: .secondary)
    }
}

extension SplitViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalManager.animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withClass: AnimalTableViewCell.self,
            for: indexPath
        )
        let animal = animalManager.animals[indexPath.row]
        cell.setLabel(name: animal.name, emoji: animal.emoji)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension SplitViewController: TableViewControllerDataSource {
    func tableViewController(_ viewController: TableViewController, rowForDelete indexPath: IndexPath) {
        animalManager.delete(at: indexPath.row)
    }
}
