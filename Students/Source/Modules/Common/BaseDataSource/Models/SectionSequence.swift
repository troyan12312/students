//
//  SectionSequence.swift
//  CRP
//
//  Created by Gienadij Mackiewicz on 19/03/2019.
//  Copyright © 2019 Altconnect. All rights reserved.
//

import Foundation

struct SectionSequence {
    
    // MARK: - Public attributes
    
    public private(set) var sections: [SectionInterface] {
        didSet {
            self.dictionary = SectionMapper.map(sections: sections)
        }
    }

    /// Boolean which indicates whether sections are empty
    var isEmpty: Bool {
        return sections.allSatisfy { $0.isEmpty }
    }
    
    // MARK: - Private attributes
    
    var dictionary: [IndexPath: ReusableViewConfiguratorInterface] = [:]
    
    // MARK: - Initialization
    
    init(sections: [SectionInterface] = []) {
        self.sections = sections
        self.dictionary = SectionMapper.map(sections: sections)
    }
    
    // MARK: - Access methods
    
    func indexPath(for reusableViewConfigurator: ReusableViewConfiguratorInterface) -> IndexPath? {
        let result = self.dictionary.filter { $0.value === reusableViewConfigurator }
        
        if let indexPath = result.keys.first {
            return indexPath
        }
        return nil
    }
    
    func reusableViewConfigurator(for indexPath: IndexPath) -> ReusableViewConfiguratorInterface? {
        return dictionary[indexPath]
    }
    
    mutating func removeCellConfigurator(for indexPath: IndexPath) {
        guard reusableViewConfigurator(for: indexPath) != nil else {
            return
        }
        
        sections[indexPath.section].cellConfigurators.remove(at: indexPath.row)
    }
    
    mutating func insertCellConfigurator(_ cellConfigurator: ReusableViewConfiguratorInterface,
                                         at indexPath: IndexPath) {
        guard dictionary.contains(where: { $0.key.section == indexPath.section }) else {
            return
        }
        
        sections[indexPath.section].cellConfigurators.insert(cellConfigurator, at: indexPath.row)
    }
    
    mutating func removeSection(for index: Int) {
        guard sections.indices.contains(index) else { return }
        sections.remove(at: index)
    }
    
    mutating func insertSection(_ section: SectionInterface, at index: Int) {
        sections.insert(section, at: index)
    }
}
