//
//  NSLayoutAnchor.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//

import UIKit

@objc extension NSLayoutAnchor {
    @discardableResult
    func constrain(_ relation: NSLayoutConstraint.Relation = .equal,
                   anchor: NSLayoutAnchor,
                   constant: CGFloat = 0.0,
                   priority: UILayoutPriority = .required,
                   isActive: Bool = true) -> NSLayoutConstraint {
        var constraint: NSLayoutConstraint
        
        switch relation {
        case .equal:
            constraint = self.constraint(equalTo: anchor, constant: constant)
            
        case .greaterThanOrEqual:
            constraint = self.constraint(greaterThanOrEqualTo: anchor, constant: constant)
            
        case .lessThanOrEqual:
            constraint = self.constraint(lessThanOrEqualTo: anchor, constant: constant)
            
        @unknown default:
            constraint = self.constraint(equalTo: anchor, constant: constant)
        }
        
        constraint.set(priority: priority, isActive: isActive)
        
        return constraint
    }
}

extension NSLayoutDimension {
    @discardableResult
    func constrain(_ relation: NSLayoutConstraint.Relation = .equal,
                   anchor: NSLayoutDimension,
                   constant: CGFloat = 0.0,
                   multiplier: CGFloat = 1.0,
                   priority: UILayoutPriority = .required,
                   isActive: Bool = true) -> NSLayoutConstraint {
        
        let constraint: NSLayoutConstraint
        
        switch relation {
        case .equal:
            constraint = self.constraint(equalTo: anchor, multiplier: multiplier, constant: constant)
            
        case .greaterThanOrEqual:
            constraint = self.constraint(greaterThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
            
        case .lessThanOrEqual:
            constraint = self.constraint(lessThanOrEqualTo: anchor, multiplier: multiplier, constant: constant)
            
        @unknown default:
            constraint = self.constraint(equalToConstant: constant)
        }
        
        constraint.set(priority: priority, isActive: isActive)
        
        return constraint
    }
    
    @discardableResult
    func constrain(_ relation: NSLayoutConstraint.Relation = .equal,
                   constant: CGFloat = 0.0,
                   prioritizeAs priority: UILayoutPriority = .required,
                   isActive: Bool = true) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint
        
        switch relation {
        case .equal:
            constraint = self.constraint(equalToConstant: constant)
            
        case .greaterThanOrEqual:
            constraint = self.constraint(greaterThanOrEqualToConstant: constant)
            
        case .lessThanOrEqual:
            constraint = self.constraint(lessThanOrEqualToConstant: constant)
            
        @unknown default:
            constraint = self.constraint(equalToConstant: constant)
        }
        
        constraint.set(priority: priority, isActive: isActive)
        
        return constraint
    }
}
