//
//  JSONResponseResolver.swift
//  CRP
//
//  Created by Robert Mietelski on 15.01.2019.
//  Copyright © 2019 altconnect. All rights reserved.
//

import Alamofire

public class JSONResponseResolver: NSObject {
    
    // MARK: - Public attributes
    
    public let components: JSONTaskComponents
    
    // MARK: - Initialization
    
    public init(components: JSONTaskComponents) {
        self.components = components
    }
    
    // MARK: - Access methods
    
    public func resolve(response: DataResponse<Any>) {
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            let statusCode: HTTPStatus
            
            if let rawValue = response.response?.statusCode, let code = HTTPStatus(rawValue: rawValue) {
                statusCode = code
            } else {
                statusCode = HTTPStatus.unknown
            }
            
            Logger.debug("URL: \(self.components.url)")
            // Logger.debug("Execution Time = \(Date().timeIntervalSince(date))")
            
            switch response.result {
                
            case .success(let data):
                
                if let json = data as? [String: Any] {
                    if !statusCode.isSuccessCode {
                        let userDescription = json["error_description"] as? String
                        let developerDescription = json["developerMessage"] as? String
                        
                        let error = HTTPError(statusCode: statusCode.rawValue,
                                              userDescription: userDescription,
                                              developerDescription: developerDescription)
                        
                        Logger.debug("Response Error:\n\t description = \(error.localizedDescription)\n\t code = \(statusCode)")
                        
                        DispatchQueue.main.sync {
                            self.components.failure?(error)
                        }
                    } else {
                        Logger.debug("Response JSON: \(data)")
                        
                        DispatchQueue.main.sync {
                            self.components.success?(json)
                        }
                    }
                } else if let array = data as? [[String: Any]] {
                    // Workaround when server returns flat array of objects
                    DispatchQueue.main.sync {
                        self.components.success?(["content": array])
                    }
                } else {
                    Logger.debug("Casting Error:\n\t data = \(data)")
                    
                    DispatchQueue.main.sync {
                        self.components.failure?(HTTPError(statusCode: statusCode.rawValue,
                                                           userDescription: "errorInvalidData".localized))
                    }
                }
                
            case .failure(let error):
                DispatchQueue.main.sync {
                    Logger.error("Request error with error: \(error)")
                    self.components.failure?(HTTPError(statusCode: (error as NSError).code,
                                                       userDescription: error.localizedDescription))
                }
            }
        }
    }
}
