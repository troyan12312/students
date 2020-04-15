//
//  BaseTableViewDataSource.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//

import UIKit

class BaseTableViewDataSource: NSObject {
    var sections = [SectionInterface]()
    var emptyDataView: UIView?
    
    fileprivate func shouldPresentEmptyListView() -> Bool {
        return (self.sections.isEmpty || !sections.compactMap { $0.isEmpty }.contains(false) ) && self.emptyDataView != nil
    }
    
    fileprivate func configurator(for indexPath: IndexPath) -> ReusableViewConfiguratorInterface {
        let section = self.sections[indexPath.section]
        return section.cellConfigurators[indexPath.row]
    }
}

extension BaseTableViewDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if self.shouldPresentEmptyListView() {
            tableView.backgroundView = emptyDataView
            return 0
        }
        tableView.backgroundView = nil
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = self.sections[section]
        return section.cellConfigurators.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let configurator = self.configurator(for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: configurator.reuseIdentifier, for: indexPath)
        configurator.configure(view: cell)
        
        return cell
    }
}

extension BaseTableViewDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.configurator(for: indexPath).layoutHeight(relativeTo: tableView.bounds.size)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard !self.sections.isEmpty, let headerConfigurator = self.sections[section].headerConfigurator else {
            return CGFloat.leastNormalMagnitude
        }
        return headerConfigurator.layoutHeight(relativeTo: tableView.bounds.size)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard !self.sections.isEmpty, let footerConfigurator = self.sections[section].footerConfigurator else {
            return CGFloat.leastNormalMagnitude
        }
        return footerConfigurator.layoutHeight(relativeTo: tableView.bounds.size)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let model: SectionInterface = self.sections[section]
        
        guard let reuseIdentifier = model.headerConfigurator?.reuseIdentifier,
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) else {
                return nil
        }
        model.headerConfigurator?.configure(view: headerView)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let model: SectionInterface = self.sections[section]
        
        guard let reuseIdentifier = model.footerConfigurator?.reuseIdentifier,
            let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) else {
                return nil
        }
        model.footerConfigurator?.configure(view: footerView)
        
        return footerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.configurator(for: indexPath).didSelectItemAtIndexPath(indexPath: indexPath)
    }
}
