//
//  DialogManager.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//

import UIKit

class DialogManager {
    
    // MARK: - Private attributes
    
    private static let windowManager = WindowManager()
    
    // MARK: - Access methods
    
    static func showDialog(title: String?,
                           message: String,
                           cancelButtonTitle: String? = nil,
                           otherButtonTitles: [String] = [],
                           presentBlock: (() -> Void)? = nil,
                           dismissBlock: ((Int?) -> Void)? = nil) {
        
        let previousWindow = UIApplication.shared.keyWindow
        previousWindow?.resignKey()
        
        let dismissWindow: (Int?) -> Void = { [weak previousWindow] index in
            self.windowManager.window.isHidden = true
            self.windowManager.window.resignKey()
            previousWindow?.makeKeyAndVisible()
            dismissBlock?(index)
        }
        
        self.windowManager.window.windowLevel = UIWindow.Level.alert
        self.windowManager.window.makeKeyAndVisible()
        self.windowManager.window.isHidden = false
        
        self.windowManager.window.rootViewController?.showDialog(title: title,
                                                                 message: message,
                                                                 cancelButtonTitle: cancelButtonTitle,
                                                                 otherButtonTitles: otherButtonTitles,
                                                                 presentBlock: presentBlock,
                                                                 dismissBlock: dismissWindow)
    }
    
    static func showConfirmationDialog(title: String? = nil,
                                       message: String,
                                       cancelButtonTitle: String = "no".localized,
                                       otherButtonTitles: [String] = ["yes".localized],
                                       acceptBlock: (() -> Void)? = nil,
                                       rejectBlock: (() -> Void)? = nil) {
        
        self.showDialog(title: title,
                        message: message,
                        cancelButtonTitle: cancelButtonTitle,
                        otherButtonTitles: otherButtonTitles,
                        dismissBlock: { index in
                            if index == nil {
                                rejectBlock?()
                            } else {
                                acceptBlock?()
                            }
        })
    }
    
    static func showInformationDialog(title: String? = nil,
                                      message: String,
                                      presentBlock: (() -> Void)? = nil,
                                      dismissBlock: (() -> Void)? = nil) {
        
        self.showDialog(title: title,
                        message: message,
                        cancelButtonTitle: "ok".localized,
                        presentBlock: presentBlock,
                        dismissBlock: { _ in dismissBlock?() })
    }
    
    static func showErrorDialog(with error: Error,
                                presentBlock: (() -> Void)? = nil,
                                dismissBlock: (() -> Void)? = nil) {
        
        self.showDialog(title: "error".localized,
                        message: error.localizedDescription,
                        cancelButtonTitle: "ok".localized,
                        presentBlock: presentBlock,
                        dismissBlock: { _ in dismissBlock?() })
    }
}
