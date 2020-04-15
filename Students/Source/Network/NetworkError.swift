//
//  NetworkError.swift
//  CRP
//
//  Created by Robert Mietelski on 27.08.2018.
//  Copyright © 2018 altconnect. All rights reserved.
//

import Foundation

public protocol NetworkError: Error {
    var statusCode: Int { get }
    var developerDescription: String? { get }
}
