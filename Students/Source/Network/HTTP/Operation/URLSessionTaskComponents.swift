//
//  URLSessionTaskComponents.swift
//  CRP
//
//  Created by Robert Mietelski on 15.01.2019.
//  Copyright © 2019 altconnect. All rights reserved.
//

import Alamofire

public struct URLSessionTaskComponents: JSONTaskComponents {

    // MARK: - Public attributes

    public let url: URLConvertible
    public let method: HTTPMethod
    public let parameters: Parameters?
    public let encoding: ParameterEncoding
    public let headers: HTTPHeaders?
    public let success: (([String: Any]) -> (Void))?
    public let failure: ((NetworkError) -> (Void))?

    // MARK: - Initialization

    public init(url: URLConvertible,
                method: HTTPMethod,
                parameters: Parameters?,
                encoding: ParameterEncoding,
                headers: HTTPHeaders?,
                success:(([String: Any]) -> (Void))?,
                failure:((NetworkError) -> (Void))?) {

        self.url = url
        self.method = method
        self.parameters = parameters
        self.encoding = encoding
        self.headers = headers
        self.success = success
        self.failure = failure
    }

    // MARK: - Access methods

    public func componentsByChanging(url: URLConvertible) -> URLSessionTaskComponents {
        return URLSessionTaskComponents(url: url,
                                        method: self.method,
                                        parameters: self.parameters,
                                        encoding: self.encoding,
                                        headers: self.headers,
                                        success: self.success,
                                        failure: self.failure)
    }

    public func componentsByChanging(method: HTTPMethod) -> URLSessionTaskComponents {
        return URLSessionTaskComponents(url: self.url,
                                        method: method,
                                        parameters: self.parameters,
                                        encoding: self.encoding,
                                        headers: self.headers,
                                        success: self.success,
                                        failure: self.failure)
    }

    public func componentsByChanging(parameters: Parameters?) -> URLSessionTaskComponents {
        return URLSessionTaskComponents(url: self.url,
                                        method: self.method,
                                        parameters: parameters,
                                        encoding: self.encoding,
                                        headers: self.headers,
                                        success: self.success,
                                        failure: self.failure)
    }

    public func componentsByChanging(encoding: ParameterEncoding) -> URLSessionTaskComponents {
        return URLSessionTaskComponents(url: self.url,
                                        method: self.method,
                                        parameters: self.parameters,
                                        encoding: encoding,
                                        headers: self.headers,
                                        success: self.success,
                                        failure: self.failure)
    }

    public func componentsByChanging(headers: HTTPHeaders?) -> URLSessionTaskComponents {
        return URLSessionTaskComponents(url: self.url,
                                        method: self.method,
                                        parameters: self.parameters,
                                        encoding: self.encoding,
                                        headers: headers,
                                        success: self.success,
                                        failure: self.failure)
    }

    public func componentsByChanging(success: (([String: Any]) -> (Void))?) -> URLSessionTaskComponents {
        return URLSessionTaskComponents(url: self.url,
                                        method: self.method,
                                        parameters: self.parameters,
                                        encoding: self.encoding,
                                        headers: self.headers,
                                        success: success,
                                        failure: self.failure)
    }

    public func componentsByChanging(failure: ((NetworkError) -> (Void))?) -> URLSessionTaskComponents {
        return URLSessionTaskComponents(url: self.url,
                                        method: self.method,
                                        parameters: self.parameters,
                                        encoding: self.encoding,
                                        headers: self.headers,
                                        success: self.success,
                                        failure: failure)
    }
}
