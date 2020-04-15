//
//  SectionInterface.swift
//  CRP
//
//  Created by Gienadij Mackiewicz on 14/03/2019.
//

import Foundation

protocol SectionInterface {
    var headerConfigurator: ReusableViewConfiguratorInterface? { get }
    var footerConfigurator: ReusableViewConfiguratorInterface? { get }
    var cellConfigurators: [ReusableViewConfiguratorInterface] { get set } 
    var isEmpty: Bool { get }
}
