//
//  SplitViewController.swift
//  SplitViewApp
//
//  Created by 1 on 2022/02/13.
//

import UIKit

class SplitViewController: UISplitViewController {
    let tableViewController: TableViewController = TableViewController()
    var animals: [Animal] = AnimalManager().animals
    
    override func viewDidLoad() {
        tableViewController.tableView.dataSource = self
        setViewController(tableViewController, for: .primary)
    }
}

extension SplitViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withClass: AnimalTableViewCell.self,
            for: indexPath
        )
        let animal = animals[indexPath.row]
        cell.setLabel(name: animal.name, emoji: animal.emoji)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
