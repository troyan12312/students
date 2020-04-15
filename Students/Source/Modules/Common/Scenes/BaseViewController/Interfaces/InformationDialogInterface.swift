//
//  InformationDialogInterface.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//

import Foundation

protocol InformationDialogInterface: class {
    func showInformationDialog(title: String?, message: String, presentBlock: (() -> Void)?, dismissBlock: (() -> Void)?)
    func showInformationDialog(title: String?, message: String, presentBlock: (() -> Void)?)
    func showInformationDialog(title: String?, message: String, dismissBlock: (() -> Void)?)
    func showInformationDialog(title: String?, message: String)
    func showInformationDialog(message: String, presentBlock: (() -> Void)?)
    func showInformationDialog(message: String, dismissBlock: (() -> Void)?)
    func showInformationDialog(message: String)
}

extension InformationDialogInterface {
    func showInformationDialog(title: String?, message: String, presentBlock: (() -> Void)?) {
        self.showInformationDialog(title: title, message: message, presentBlock: presentBlock, dismissBlock: nil)
    }
    
    func showInformationDialog(title: String?, message: String, dismissBlock: (() -> Void)?) {
        self.showInformationDialog(title: title, message: message, presentBlock: nil, dismissBlock: dismissBlock)
    }
    
    func showInformationDialog(title: String?, message: String) {
        self.showInformationDialog(title: title, message: message, presentBlock: nil, dismissBlock: nil)
    }
    
    func showInformationDialog(message: String, presentBlock: (() -> Void)?) {
        self.showInformationDialog(title: nil, message: message, presentBlock: presentBlock, dismissBlock: nil)
    }
    
    func showInformationDialog(message: String, dismissBlock: (() -> Void)?) {
        self.showInformationDialog(title: nil, message: message, presentBlock: nil, dismissBlock: dismissBlock)
    }
    
    func showInformationDialog(message: String) {
        self.showInformationDialog(title: nil, message: message, presentBlock: nil, dismissBlock: nil)
    }
}
