//
//  HTTPClient.swift
//  CRP
//
//  Created by Gienadij Mackiewicz on 13.07.2018.
//

import Alamofire

public class HTTPClient {

    // MARK: - Public attributes
    
    public var baseURL: URL {
        return self.manager.baseURL
    }
    
    public var applicationContext: String? {
        return self.manager.applicationContext
    }
    
    public var serverAddress: URL {
        return self.manager.serverAddress
    }
    
    static public let shared = HTTPClient(timeoutInterval: 15.0)
    
    // MARK: - Private attributes
    
    private var manager: NetworkAccessManager
    
    // MARK: - Initialization
    
    private convenience init?(timeoutInterval: TimeInterval) {
        guard let baseURL = HTTPServerConfiguration.default.serverAddress else {
            return nil
        }
        
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = timeoutInterval
        sessionConfiguration.timeoutIntervalForResource = timeoutInterval;
        
        self.init(baseURL: baseURL, applicationContext: HTTPServerConfiguration.default.applicationContext)
    }
    
    public init(baseURL: URL,
                applicationContext: String?,
                sessionConfiguration: URLSessionConfiguration = URLSessionConfiguration.default,
                delegate: SessionDelegate = SessionDelegate(),
                serverTrustManager: ServerTrustPolicyManager? = nil) {
        
        self.manager = NetworkAccessManager(baseURL: baseURL,
                                            applicationContext: applicationContext,
                                            sessionConfiguration: sessionConfiguration,
                                            delegate: delegate,
                                            serverTrustManager: serverTrustManager)
    }
}

// MARK: - Session operation management

extension HTTPClient {
    private func sessionOperation(URLString: String,
                                  method: HTTPMethod,
                                  parameters: Parameters?,
                                  queryParameters: Parameters? = nil,
                                  encoding: ParameterEncoding,
                                  headers: HTTPHeaders? = nil,
                                  success: (([String: Any]) -> Void)?,
                                  failure: ((NetworkError) -> Void)?) {

        return self.manager.sessionOperation(URLString: URLString,
                                             method: method,
                                             parameters: parameters,
                                             encoding: encoding,
                                             headers: headers,
                                             success: success,
                                             failure: failure)
    }
}

// MARK: - HTTP support

extension HTTPClient {
    public func GET(URLString: String,
                    parameters: Parameters? = nil,
                    encoding: ParameterEncoding = JSONEncoding.default,
                    success: (([String: Any]) -> Void)?,
                    failure: ((NetworkError) -> Void)?) {
        self.sessionOperation(URLString: URLString, method: .get, parameters: parameters, encoding: encoding, success: success, failure: failure)
    }

    public func HEAD(URLString: String,
                     parameters: Parameters? = nil,
                     encoding: ParameterEncoding = JSONEncoding.default,
                     success: (([String: Any]) -> Void)?,
                     failure: ((NetworkError) -> Void)?) {
        self.sessionOperation(URLString: URLString, method: .head, parameters: parameters, encoding: encoding, success: success, failure: failure)
    }

    public func POST(URLString: String,
                     parameters: Parameters? = nil,
                     queryParameters: Parameters? = nil,
                     encoding: ParameterEncoding = JSONEncoding.default,
                     success: (([String: Any]) -> Void)?,
                     failure: ((NetworkError) -> Void)?) {
        self.sessionOperation(URLString: URLString, method: .post, parameters: parameters, queryParameters: queryParameters, encoding: encoding, success: success, failure: failure)
    }

    public func PUT(URLString: String,
                    parameters: Parameters? = nil,
                    encoding: ParameterEncoding = JSONEncoding.default,
                    success: (([String: Any]) -> Void)?,
                    failure: ((NetworkError) -> Void)?) {
        self.sessionOperation(URLString: URLString, method: .put, parameters: parameters, encoding: encoding, success: success, failure: failure)
    }

    public func PATCH(URLString: String,
                      parameters: Parameters? = nil,
                      encoding: ParameterEncoding = JSONEncoding.default,
                      success: (([String: Any]) -> Void)?,
                      failure: ((NetworkError) -> Void)?) {
        self.sessionOperation(URLString: URLString, method: .patch, parameters: parameters, encoding: encoding, success: success, failure: failure)
    }

    public func DELETE(URLString: String,
                       parameters: Parameters? = nil,
                       encoding: ParameterEncoding = JSONEncoding.default,
                       success: (([String: Any]) -> Void)?,
                       failure: ((NetworkError) -> Void)?) {
        self.sessionOperation(URLString: URLString, method: .delete, parameters: parameters, encoding: encoding, success: success, failure: failure)
    }
}
