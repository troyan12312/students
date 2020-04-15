//
//  StudentCoordinator.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//

import UIKit

final class StudentCoordinator: Coordinator {
    
    private let viewControllerFactory = StudentViewControllerFactory()
    
    override func start(animated: Bool = true, completion: (() -> ())? = nil) {
        routeList()
    }
    
    private func routeList(animated: Bool = true) {
        let viewController = viewControllerFactory.makeStudentListViewController()
        
        navigationController?.setViewControllers([viewController], animated: animated)
    }
}
