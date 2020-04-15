//
//  StudentListViewController.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//

final class StudentListViewController: BaseTableViewController {
    
    public let viewModel = StudentListViewModel()
    
    private let dataSource = BaseTableViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension StudentListViewController {
    private func bindViewModel() {
        viewModel.onSectionSequenceChange = { [weak self] sectionSequence in
            self?.dataSource.sections = sectionSequence.sections
            if self?.isViewLoaded ?? false {
                let emptyDataType = EmptyDataType(sectionSequence: sectionSequence)
                self?.setupEmptyDataView(with: emptyDataType)
                self?.registerReusableViews(from: sectionSequence.sections)
                self?.tableView.reloadData()
            }
        }
    }
}

extension StudentListViewController {
    private func setupView() {
        view.backgroundColor = .red
    }
    
    private func setupNavigationBar() {
        
    }
    
    private func setupEmptyDataView(with type: EmptyDataType = .none) {
        emptyDataView.configure(type: type, contentOffset: emptyDataDefaultContentOffset)
        dataSource.emptyDataView = emptyDataView
    }
    
    private func setupTableView() {
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
    }
}
