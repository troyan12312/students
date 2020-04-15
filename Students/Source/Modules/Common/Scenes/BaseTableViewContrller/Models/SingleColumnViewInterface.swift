//
//  SingleColumnViewInterface.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//

import UIKit

protocol SingleColumnViewInterface: class {
    var tableView: UITableView { get }
}

extension SingleColumnViewControlerInterface {
    func registerReusableViews(from sections: [SectionInterface]) {
        let uniqueCells = sections
            .flatMap { $0.cellConfigurators }
            .unique(by: { String(describing: $0.type) })
        let uniqueHeaders = sections
            .compactMap { $0.headerConfigurator }
            .unique(by: { String(describing: $0.type) })
        let uniqueFooters = sections
            .compactMap { $0.footerConfigurator }
            .unique(by: { String(describing: $0.type) })
        
        for cellConfigurator in uniqueCells {
            if let nibName = cellConfigurator.nibName {
                tableView.register(UINib(nibName: nibName, bundle: nil),
                                   forCellReuseIdentifier: cellConfigurator.reuseIdentifier)
            } else {
                tableView.register(cellConfigurator.type,
                                   forCellReuseIdentifier: cellConfigurator.reuseIdentifier)
            }
        }
        
        for headerConfigurator in uniqueHeaders {
            if let nibName = headerConfigurator.nibName {
                tableView.register(UINib(nibName: nibName, bundle: nil),
                                   forHeaderFooterViewReuseIdentifier: headerConfigurator.reuseIdentifier)
            } else {
                tableView.register(headerConfigurator.type,
                                   forHeaderFooterViewReuseIdentifier: headerConfigurator.reuseIdentifier)
            }
        }
        
        for footerConfigurator in uniqueFooters {
            if let nibName = footerConfigurator.nibName {
                tableView.register(UINib(nibName: nibName, bundle: nil),
                                   forHeaderFooterViewReuseIdentifier: footerConfigurator.reuseIdentifier)
            } else {
                tableView.register(footerConfigurator.type,
                                   forHeaderFooterViewReuseIdentifier: footerConfigurator.reuseIdentifier)
            }
        }
    }
}

extension Array {
    func unique<T:Hashable>(by: ((Element) -> (T)))  -> [Element] {
        var set = Set<T>()
        var arrayOrdered = [Element]()
        for value in self {
            if !set.contains(by(value)) {
                set.insert(by(value))
                arrayOrdered.append(value)
            }
        }
        return arrayOrdered
    }
}
