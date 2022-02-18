//
//  TableViewController.swift
//  SplitViewApp
//
//  Created by 1 on 2022/02/13.
//

import UIKit

protocol TableViewControllerDataSource: AnyObject {
    func tableViewController(_ viewController: TableViewController, numbersOfSection: Int) -> Int
    func tableViewController(_ viewController: TableViewController, rowForAnimal indexPath: IndexPath) -> Animal
    func tableViewController(_ viewController: TableViewController, rowForDelete inedexPath: IndexPath)
}

class TableViewController: UIViewController {
    weak var dataSource: TableViewControllerDataSource?
    
    let tableView: UITableView = {
        var tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.register(cellWithClass: AnimalTableViewCell.self)
        return tableView
    }()
    
    override func loadView() {
        view = .init()
        view.backgroundColor = UIColor(r: 230, g: 231, b: 156)
        view.addSubview(tableView)
        setTableViewLayout()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setTableViewLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int
    ) -> Int {
        return dataSource?.tableViewController(self, numbersOfSection: .zero) ?? .zero
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withClass: AnimalTableViewCell.self,
            for: indexPath
        )
        let animal = dataSource?.tableViewController(self, rowForAnimal: indexPath)
        cell.setLabel(name: animal?.name, emoji: animal?.emoji)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { [weak self] _, _, _ in
            self!.dataSource?.tableViewController(self!, rowForDelete: indexPath) // Model먼저 삭제
            tableView.deleteRows(at: [indexPath], with: .top)
        }
        deleteAction.image = UIImage(systemName: "trash.fill")
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
