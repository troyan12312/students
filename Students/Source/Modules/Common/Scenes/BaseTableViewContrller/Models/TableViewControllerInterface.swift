//
//  TableViewControllerInterface.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//

import UIKit

protocol TableViewControllerInterface: class {
    func scrollToRow(at indexPath: IndexPath, completion: ((Bool) -> Void)?)
    func reloadRows(at indexPaths: [IndexPath])
    func update()
}

extension TableViewControllerInterface where Self: BaseTableViewController {
    func scrollToRow(at indexPath: IndexPath, completion: ((Bool) -> Void)?) {
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            self?.tableView.scrollToRow(at: indexPath, at: .middle, animated: false)
        }, completion: completion)
    }
    
    func reloadRows(at indexPaths: [IndexPath]) {
        self.tableView.reloadRows(at: indexPaths, with: .automatic)
    }
    
    func update() {
        UIView.performWithoutAnimation { [weak self] in
            self?.tableView.beginUpdates()
            self?.tableView.endUpdates()
        }
    }
}
