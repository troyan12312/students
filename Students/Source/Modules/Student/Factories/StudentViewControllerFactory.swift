//
//  StudentViewControllerFactory.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//

final class StudentViewControllerFactory {
    
    func makeStudentListViewController() -> StudentListViewController {
        return StudentListViewController()
    }
}
