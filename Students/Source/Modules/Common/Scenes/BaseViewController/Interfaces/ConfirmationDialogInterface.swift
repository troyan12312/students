//
//  ConfirmationDialogInterface.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//

import Foundation

protocol ConfirmationDialogInterface: class {
    func showConfirmationDialog(title: String?, message: String, acceptBlock: (() -> Void)?, rejectBlock: (() -> Void)?)
    func showConfirmationDialog(title: String?, message: String, acceptBlock: (() -> Void)?)
    func showConfirmationDialog(title: String?, message: String, rejectBlock: (() -> Void)?)
    func showConfirmationDialog(message: String, acceptBlock: (() -> Void)?, rejectBlock: (() -> Void)?)
    func showConfirmationDialog(message: String, acceptBlock: (() -> Void)?)
    func showConfirmationDialog(message: String, rejectBlock: (() -> Void)?)
}

extension ConfirmationDialogInterface {
    func showConfirmationDialog(title: String?, message: String, acceptBlock: (() -> Void)?) {
        self.showConfirmationDialog(title: title, message: message, acceptBlock: acceptBlock, rejectBlock: nil)
    }
    
    func showConfirmationDialog(title: String?, message: String, rejectBlock: (() -> Void)?) {
        self.showConfirmationDialog(title: title, message: message, acceptBlock: nil, rejectBlock: rejectBlock)
    }
    
    func showConfirmationDialog(message: String, acceptBlock: (() -> Void)?, rejectBlock: (() -> Void)?) {
        self.showConfirmationDialog(title: nil, message: message, acceptBlock: acceptBlock, rejectBlock: rejectBlock)
    }
    
    func showConfirmationDialog(message: String, acceptBlock: (() -> Void)?) {
        self.showConfirmationDialog(title: nil, message: message, acceptBlock: acceptBlock, rejectBlock: nil)
    }
    
    func showConfirmationDialog(message: String, rejectBlock: (() -> Void)?) {
        self.showConfirmationDialog(title: nil, message: message, acceptBlock: nil, rejectBlock: rejectBlock)
    }
}
