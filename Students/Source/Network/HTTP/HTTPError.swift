//
//  HTTPError.swift
//  CRP
//
//  Created by Robert Mietelski on 15.01.2019.
//  Copyright © 2019 altconnect. All rights reserved.
//

import Foundation

struct HTTPError : NetworkError {
    public let statusCode: Int
    public let userDescription: String?
    public let developerDescription: String?
    
    init(statusCode: Int, userDescription: String? = nil, developerDescription: String? = nil) {
        self.statusCode = statusCode
        self.userDescription = userDescription
        self.developerDescription = developerDescription
    }
}

extension HTTPError: LocalizedError {
    var errorDescription: String? {
        if let description = self.userDescription {
            return description
        }
        if let description = self.developerDescription {
            return description
        }
        return "errorUnknown".localized
    }
}
