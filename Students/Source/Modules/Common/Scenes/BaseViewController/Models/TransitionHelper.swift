//
//  TransitionHelper.swift
//  Students
//
//  Created by Dawid Trojanowski on 15/04/2020.
//  Copyright © 2020 Dawid Trojanowski. All rights reserved.
//

import Foundation

class TransitionHelper {
    var viewWillAppear: ((_ animated: Bool) -> Void)?
    var viewDidAppear: ((_ animated: Bool) -> Void)?
    var viewWillDisappear: ((_ animated: Bool) -> Void)?
    var viewDidDisappear: ((_ animated: Bool) -> Void)?
}
