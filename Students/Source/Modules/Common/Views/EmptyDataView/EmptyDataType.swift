//
//  EmptyDataType.swift
//  CRP
//
//  Created by Gienadij Mackiewicz on 26/03/2019.
//  Copyright © 2019 Altconnect. All rights reserved.
//

import UIKit

/// Type of empty data
///
/// - none: "invisible" empty data
/// - noData: No data available. Optionally with associated value that is a custom title.
/// - errorOccurred: The network is not reachable or any other error occurred. Associated value is an error description.
enum EmptyDataType: Equatable {
    case none
    case noData(String?)
    case errorOccurred(String)
    
    /// Localized title of empty data
    var localizedTitle: String? {
        switch self {
        case .noData(let customTitle):
            guard let customTitle = customTitle else {
                return "emptyDataNoData".localized
            }
            
            return customTitle
        case .errorOccurred(let errorDescription):
                return errorDescription
        default:
            return nil
        }
    }
    
    /// Image of empty data
    var image: UIImage? {
        switch self {
        case .noData:
            return nil
        case .errorOccurred:
            return nil
        default:
            return nil
        }
    }
    
    // MARK: Initialization
    
    init(sectionSequence: SectionSequence, customTitle: String? = nil) {
        sectionSequence.isEmpty ? (self = .noData(customTitle)) : (self = .none)
    }
    
    init(error: Error, customTitle: String = "emptyDataErrorOccurred".localized) {
        var title: String = customTitle
        if let httpError = error as? HTTPError,
            let httpStatus = HTTPStatus(rawValue: httpError.statusCode),
            httpStatus.isConnectionErrorCode {
            title = customTitle + "\n" + "emptyDataNoInternet".localized
        }
        
        self = .errorOccurred(title)
    }
}
