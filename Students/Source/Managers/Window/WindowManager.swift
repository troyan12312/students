//
//  WindowManager.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//

import UIKit

class WindowManager {
    
    // MARK: - Public attributes
    
    let window = WindowManager.window()
    
    // MARK: - Access methods
    
    func showViewController(viewController: ViewControllerInterface,
                            inWindow currentWindow: UIWindow,
                            presentBlock: (() -> Void)? = nil,
                            dismissBlock: (() -> Void)? = nil) {
        
        let previousWindow = UIApplication.shared.keyWindow
        previousWindow?.resignKey()
        
        viewController.transitionHelper.viewDidDisappear = { [weak currentWindow, weak previousWindow] _ in
            if viewController.presentedViewController == nil {
                currentWindow?.isHidden = true
                currentWindow?.resignKey()
                previousWindow?.makeKeyAndVisible()
                dismissBlock?()
            }
        }
        
        currentWindow.windowLevel = UIWindow.Level.normal
        currentWindow.makeKeyAndVisible()
        currentWindow.isHidden = false
        currentWindow.rootViewController?.present(viewController, animated: true, completion: presentBlock)
    }
    
    func showViewController(viewController: ViewControllerInterface,
                            presentBlock: (() -> Void)? = nil,
                            dismissBlock: (() -> Void)? = nil) {
        
        self.showViewController(viewController: viewController,
                                inWindow: self.window,
                                presentBlock: presentBlock,
                                dismissBlock: dismissBlock)
    }
    
    // MARK: - Build window
    
    private static func window() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIViewController()
        window.backgroundColor = UIColor.clear
        
        return window
    }
}
