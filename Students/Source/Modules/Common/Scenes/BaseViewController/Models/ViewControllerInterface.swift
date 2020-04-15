//
//  ViewControllerInterface.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//


import UIKit

typealias ViewControllerInterface = UIViewController & TransitionHelperInterface

protocol TransitionHelperInterface where Self: UIViewController {
    var transitionHelper: TransitionHelper { get }
}

