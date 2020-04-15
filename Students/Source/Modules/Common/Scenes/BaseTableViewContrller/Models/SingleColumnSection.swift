//
//  SingleColumnSection.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//

import Foundation

struct SingleColumnSection: SectionInterface {
    var cellConfigurators: [ReusableViewConfiguratorInterface]
    var headerConfigurator: ReusableViewConfiguratorInterface?
    var footerConfigurator: ReusableViewConfiguratorInterface?
    
    var isEmpty: Bool {
        return cellConfigurators.isEmpty && headerConfigurator == nil && footerConfigurator == nil
    }
    
    init(cellConfigurators: [ReusableViewConfiguratorInterface],
         headerConfigurator: ReusableViewConfiguratorInterface? = nil,
         footerConfigurator: ReusableViewConfiguratorInterface? = nil) {
        self.cellConfigurators = cellConfigurators
        self.headerConfigurator = headerConfigurator
        self.footerConfigurator = footerConfigurator
    }
}
