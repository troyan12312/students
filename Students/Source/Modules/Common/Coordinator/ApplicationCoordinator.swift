//
//  ApplicationCoordinator.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//

import UIKit

public class ApplicationCoordinator {
    
    // MARK: - Public properties
    
    public var window: UIWindow?
    public var childCoordinator: Coordinator? {
        willSet {
            childCoordinator?.finish()
        }
    }
    
    // MARK: - Initialization
    
    public init(windowScene: UIWindowScene) {
        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        self.window?.windowScene = windowScene
        Logger.debug("Application Coordinator init: \(self)")
    }
    
    // MARK: - Start
    
    public func startStudentCoordinator() {
        let navigationController: BaseNavigationController = BaseNavigationController()
        let coordinator = StudentCoordinator(navigationController: navigationController)

        childCoordinator = coordinator
        coordinator.start()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
