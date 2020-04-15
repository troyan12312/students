//
//  MultipartTaskComponents.swift
//  CRP
//
//  Created by Robert Mietelski on 15.01.2019.
//  Copyright © 2019 altconnect. All rights reserved.
//

import Alamofire

public struct MultipartTaskComponents: JSONTaskComponents {
    
    // MARK: - Public attributes
    
    public let url: URLConvertible
    public let method: HTTPMethod
    public let parameters: Parameters?
    public let headers: HTTPHeaders?
    public let success: (([String: Any]) -> (Void))?
    public let failure: ((NetworkError) -> (Void))?
    
    // MARK: - Initialization
    
    public init(url: URLConvertible,
                method: HTTPMethod,
                parameters: Parameters?,
                headers: HTTPHeaders?,
                success:(([String: Any]) -> (Void))?,
                failure:((NetworkError) -> (Void))?) {
        
        self.url = url
        self.method = method
        self.parameters = parameters
        self.headers = headers
        self.success = success
        self.failure = failure
    }
}
