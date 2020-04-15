//
//  BaseTableViewController.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//

import UIKit

class BaseTableViewController: BaseViewController, SingleColumnViewControlerInterface {
    
    // MARK: - Properties
    
    var tableViewStyle: UITableView.Style  {
        return .plain
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: tableViewStyle)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        return tableView
    }()
    
    lazy var refreshControl: UIRefreshControl = {
        let control: UIRefreshControl = UIRefreshControl()
        control.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        
        return control
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAutoLayout()
    }
    
    // MARK: - Selectors
    
    @objc func refreshData(_ refreshControl: UIRefreshControl) {}
    
    // MARK: - Setup
    
    func setupAutoLayout() {
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                                     tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)])
    }
}

