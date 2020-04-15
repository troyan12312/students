//
//  ReusableViewConfiguratorInterface.swift
//  CRP
//
//  Created by Gienadij Mackiewicz on 14/03/2019.
//

import UIKit

protocol ReusableViewConfiguratorInterface: class {
    /// Required if using nib
    var nibName: String? { get }
    
    /// Required class type
    var type: AnyClass { get }
    
    /// Reuse identifier (usually there is no need to set it)
    var reuseIdentifier: String { get }
    
    /// Configure method, which is used to setup view with data
    ///
    /// - Parameter view: Any UIView, usually UITableViewCell or UICollectionViewCell
    func configure(view: UIView)
    
    /// Method called on item selection
    func didSelectItemAtIndexPath(indexPath: IndexPath)
    
    /// Method which allows to set view height
    func layoutHeight(relativeTo size: CGSize) -> CGFloat
}

// MARK: - Default values

extension ReusableViewConfiguratorInterface {
    var nibName: String? {
        return nil
    }
    
    var reuseIdentifier: String {
        return String(describing: self.type)
    }
    
    func didSelectItemAtIndexPath(indexPath: IndexPath) {}
}
