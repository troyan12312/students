//
//  ErrorDialogInterface.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//

import Foundation

protocol ErrorDialogInterface: class {
    func showErrorDialog(with error: Error, presentBlock: (() -> Void)?, dismissBlock: (() -> Void)?)
    func showErrorDialog(with error: Error, presentBlock: (() -> Void)?)
    func showErrorDialog(with error: Error, dismissBlock: (() -> Void)?)
    func showErrorDialog(with error: Error)
}

extension ErrorDialogInterface {
    func showErrorDialog(with error: Error, presentBlock: (() -> Void)?) {
        self.showErrorDialog(with:  error, presentBlock: presentBlock, dismissBlock: nil)
    }
    
    func showErrorDialog(with error: Error, dismissBlock: (() -> Void)?) {
        self.showErrorDialog(with:  error, presentBlock: nil, dismissBlock: dismissBlock)
    }
    
    func showErrorDialog(with error: Error) {
        self.showErrorDialog(with:  error, presentBlock: nil, dismissBlock: nil)
    }
}
