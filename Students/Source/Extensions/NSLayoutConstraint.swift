//
//  NSLayoutConstraint.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    func set(priority: UILayoutPriority, isActive: Bool) {
        
        self.priority = priority
        self.isActive = isActive
    }
}
