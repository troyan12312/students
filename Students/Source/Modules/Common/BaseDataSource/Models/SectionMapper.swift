//
//  SectionMapper.swift
//  CRP
//
//  Created by Gienadij Mackiewicz on 19/03/2019.
//  Copyright © 2019 Altconnect. All rights reserved.
//

import Foundation

class SectionMapper {
    static func map(sections: [SectionInterface]) -> [IndexPath: ReusableViewConfiguratorInterface] {
        return sections.enumerated().map { (column, section) in
            section.cellConfigurators.enumerated().map({ (row, cell) in
                (IndexPath(row: row, section: column), cell)
            })
            }.reduce([],+)
            .reduce(into: [IndexPath: ReusableViewConfiguratorInterface]()) { (dictionary, tuple) in
                dictionary[tuple.0] = tuple.1
        }
    }
}
